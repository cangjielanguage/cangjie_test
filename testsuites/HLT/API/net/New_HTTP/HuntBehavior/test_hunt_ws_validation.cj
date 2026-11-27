/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt --parallel=false

import stdx.net.http.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.crypto.kit.*
import std.net.*
import std.io.*
import std.convert.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func wu8(v: Int64): UInt8 { return UInt8(v & 0xFF) }

func wsFrameW(opcode: UInt8, payload: Array<UInt8>, fin: Bool, mask: Bool): Array<UInt8> {
    let out = ArrayList<UInt8>()
    let finBit: Int64 = if (fin) { 0x80 } else { 0x00 }
    out.add(wu8(finBit | Int64(opcode)))
    let maskBit: Int64 = if (mask) { 0x80 } else { 0x00 }
    let len = payload.size
    if (len < 126) {
        out.add(wu8(maskBit | Int64(len)))
    } else {
        out.add(wu8(maskBit | 126))
        out.add(wu8(len >> 8)); out.add(wu8(len))
    }
    if (mask) {
        let key: Array<UInt8> = [0x12, 0x34, 0x56, 0x78]
        for (k in key) { out.add(k) }
        var i = 0
        while (i < len) {
            out.add(wu8(Int64(payload[i]) ^ Int64(key[i % 4])))
            i += 1
        }
    } else {
        for (b in payload) { out.add(b) }
    }
    return out.toArray()
}

func closePayloadW(code: Int64): Array<UInt8> {
    return [wu8(code >> 8), wu8(code)]
}

func wsPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

var wsCapW: ?WebSocket = None<WebSocket>

func startWsServerW(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/ws", { ctx =>
        let w = WebSocket.upgradeFromServer(ctx)
        wsCapW = Some(w)
        try {
            while (true) {
                let frame = w.read()
                w.writePongFrame(frame.payload)
            }
        } catch (e: Exception) {
            println("[WS-SRV] read failed: ${e}")
        }
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func wsHandshakeW(port: Int64): TcpSocket {
    let sock = TcpSocket("127.0.0.1", UInt16(port))
    sock.connect()
    let req = "GET /ws HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Version: 13\r\n\r\n"
    sock.write(req.toArray())
    let buf = Array<UInt8>(4096, repeat: 0)
    var reply = ""
    var waited: Int64 = 0
    while (waited < 3000 && !reply.contains("\r\n\r\n")) {
        var n = 0
        var err = false
        try { n = sock.read(buf) } catch (e: Exception) { err = true }
        if (err || n <= 0) { break }
        reply = reply + String.fromUtf8(buf[0..n])
        sleep(Duration.millisecond * 10)
        waited += 50
    }
    return sock
}

func wsCollectW(sock: TcpSocket, maxWaitMs: Int64): ArrayList<(UInt8, Array<UInt8>)> {
    let parts = ArrayList<(UInt8, Array<UInt8>)>()
    let acc = ArrayList<UInt8>()
    let done = AtomicBool(false)
    spawn {
        let buf = Array<UInt8>(8192, repeat: 0)
        while (!done.load()) {
            var n = 0
            var err = false
            try { n = sock.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            var i = 0
            while (i < n) { acc.add(buf[i]); i += 1 }
        }
        done.store(true)
    }
    var waited: Int64 = 0
    var cursor = 0
    while (waited < maxWaitMs) {
        sleep(Duration.millisecond * 100)
        waited += 100
        var parsed = true
        while (parsed && acc.size - cursor >= 2) {
            let opcode = acc[cursor] & 0x0F
            let masked = (acc[cursor + 1] & 0x80) != 0
            var l = Int64(acc[cursor + 1] & 0x7F)
            var off = 2
            if (l == 126) {
                if (acc.size - cursor < 4) { parsed = false; break }
                l = (Int64(acc[cursor + 2]) << 8) + Int64(acc[cursor + 3])
                off = 4
            }
            let maskLen: Int64 = if (masked) { 4 } else { 0 }
            if (Int64(acc.size - cursor) < off + maskLen + l) { parsed = false; break }
            var payload = Array<UInt8>(l, repeat: 0)
            var i = 0
            while (i < l) {
                if (masked) {
                    let key: Array<UInt8> = [acc[cursor + off], acc[cursor + off + 1], acc[cursor + off + 2], acc[cursor + off + 3]]
                    payload[i] = wu8(Int64(acc[cursor + off + 4 + i]) ^ Int64(key[i % 4]))
                } else {
                    payload[i] = acc[cursor + off + maskLen + i]
                }
                i += 1
            }
            parts.add((opcode, payload))
            cursor += off + maskLen + l
        }
    }
    done.store(true)
    return parts
}

func sawOpcodeW(frames: ArrayList<(UInt8, Array<UInt8>)>, op: UInt8): Bool {
    for ((o, _) in frames) { if (o == op) { return true } }
    return false
}

func wsFrameRsvW(opcode: UInt8, payload: Array<UInt8>, fin: Bool, mask: Bool, rsv: Int64): Array<UInt8> {
    let base = wsFrameW(opcode, payload, fin, mask)
    base[0] = wu8(Int64(base[0]) | (rsv << 4))
    return base
}

func wsServerAliveW(port: Int64): Bool {
    let sock = wsHandshakeW(port)
    sock.write(wsFrameW(0x9, "alive".toArray(), true, true))
    let frames = wsCollectW(sock, 1500)
    let pong = sawOpcodeW(frames, 0xA)
    try { sock.close() } catch (e: Exception) { () }
    return pong
}

func wsViolationProbe(inject: Array<Array<UInt8>>): (Bool, Bool, Int64) {
    let s = startWsServerW()
    let port = Int64(s.port)
    let sock = wsHandshakeW(port)
    sleep(Duration.millisecond * 100)
    for (f in inject) { sock.write(f) }
    sock.flush()
    sleep(Duration.millisecond * 200)
    var terminated = false
    try {
        sock.write(wsFrameW(0x9, "live".toArray(), true, true))
        sock.flush()
    } catch (e: Exception) {
        terminated = true
    }
    let frames = wsCollectW(sock, 1500)
    let pong = sawOpcodeW(frames, 0xA)
    let close = sawOpcodeW(frames, 0x8)
    var code: Int64 = -1
    for ((op, pl) in frames) {
        if (op == 0x8 && pl.size >= 2) { code = (Int64(pl[0]) << 8) + Int64(pl[1]) }
    }
    sock.close()
    s.close()
    let rejected = (close && !pong) || (terminated && !pong)
    return (rejected, pong, code)
}

@Test
class HuntWsValidation {
    @TestCase
    func invalidUtf8TextAccepted(): Unit {
        let (rejected, _, code) = wsViolationProbe(
            [wsFrameW(0x1, [0xCE, 0xBA, 0xE1, 0xBA, 0xBD, 0xB1, 0xBF], true, true)])
        println("[WS-utf8] rejected=${rejected} closeCode=${code}")
        @Expect(rejected, true)
    }

    @TestCase
    func invalidCloseCode999Accepted(): Unit {
        let (rejected, _, code) = wsViolationProbe(
            [wsFrameW(0x8, closePayloadW(999), true, true)])
        println("[WS-close999] rejected=${rejected} closeCode=${code}")
        @Expect(rejected, true)
    }

    @TestCase
    func orphanContinuationAccepted(): Unit {
        let (rejected, _, code) = wsViolationProbe(
            [wsFrameW(0x0, "orphan".toArray(), true, true)])
        println("[WS-cont] rejected=${rejected} closeCode=${code}")
        @Expect(rejected, true)
    }

    @TestCase
    func unmaskedFrameRejected(): Unit {
        let (rejected, _, code) = wsViolationProbe(
            [wsFrameW(0x1, "nomask".toArray(), true, false)])
        println("[WS-unmask] rejected=${rejected} closeCode=${code}")
        @Expect(rejected, true)
    }

    @TestCase
    func validTextAlive(): Unit {
        let s = startWsServerW()
        let port = Int64(s.port)
        let sock = wsHandshakeW(port)
        sleep(Duration.millisecond * 100)
        sock.write(wsFrameW(0x1, "hello".toArray(), true, true))
        sock.flush()
        sleep(Duration.millisecond * 200)
        sock.write(wsFrameW(0x9, "live".toArray(), true, true))
        sock.flush()
        let frames = wsCollectW(sock, 1500)
        let pong = sawOpcodeW(frames, 0xA)
        let close = sawOpcodeW(frames, 0x8)
        sock.close()
        s.close()
        println("[WS-valid] pong=${pong} close=${close}")
        @Expect(pong, true)
        @Expect(close, false)
    }

    @TestCase
    func validMultibyteUtf8Alive(): Unit {
        let s = startWsServerW()
        let port = Int64(s.port)
        let sock = wsHandshakeW(port)
        sleep(Duration.millisecond * 100)
        sock.write(wsFrameW(0x1, [0xCE, 0xBA, 0xE1, 0xBA, 0xBD, 0xC2, 0xAE], true, true))
        sock.flush()
        sleep(Duration.millisecond * 200)
        sock.write(wsFrameW(0x9, "live".toArray(), true, true))
        sock.flush()
        let frames = wsCollectW(sock, 1500)
        let pong = sawOpcodeW(frames, 0xA)
        let close = sawOpcodeW(frames, 0x8)
        sock.close()
        s.close()
        println("[WS-mbutf8] pong=${pong} close=${close}")
        @Expect(pong, true)
        @Expect(close, false)
    }
    @TestCase
    func hugeDeclaredLengthNoHang(): Unit {
        let s = startWsServerW()
        let port = Int64(s.port)
        let sock = wsHandshakeW(port)
        sleep(Duration.millisecond * 100)
        let huge = ArrayList<UInt8>()
        huge.add(0x81)
        huge.add(0xFF)
        huge.add(0x7F); huge.add(0xFF); huge.add(0xFF); huge.add(0xFF)
        huge.add(0xFF); huge.add(0xFF); huge.add(0xFF); huge.add(0xFF)
        let key: Array<UInt8> = [0x12, 0x34, 0x56, 0x78]
        for (k in key) { huge.add(k) }
        var i = 0
        while (i < 10) { huge.add(wu8(Int64(0x41) ^ Int64(key[i % 4]))); i += 1 }
        sock.write(huge.toArray())
        sleep(Duration.millisecond * 1200)
        sock.close()
        let alive = wsServerAliveW(port)
        s.close()
        println("[WS-huge] serverAliveAfterHugeDecl=${alive}")
        @Expect(alive, true)
    }

    @TestCase
    func rsvBitsWithoutExtensionRejected(): Unit {
        let s = startWsServerW()
        let port = Int64(s.port)
        let sock = wsHandshakeW(port)
        sleep(Duration.millisecond * 100)
        sock.write(wsFrameRsvW(0x1, "rsv".toArray(), true, true, 0x7))
        sleep(Duration.millisecond * 1200)
        sock.close()
        let alive = wsServerAliveW(port)
        s.close()
        println("[WS-rsv] serverAliveAfterRsv=${alive}")
        @Expect(alive, true)
    }

    @TestCase
    func unknownOpcodeNoCrash(): Unit {
        let s = startWsServerW()
        let port = Int64(s.port)
        let sock = wsHandshakeW(port)
        sleep(Duration.millisecond * 100)
        sock.write(wsFrameW(0x3, "unk".toArray(), true, true))
        sleep(Duration.millisecond * 1200)
        sock.close()
        let alive = wsServerAliveW(port)
        s.close()
        println("[WS-opcode] serverAliveAfterUnknownOpcode=${alive}")
        @Expect(alive, true)
    }
}
