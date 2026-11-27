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
import stdx.encoding.hex.*
import std.net.*
import std.io.*
import std.convert.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func abPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func abU8(v: Int64): UInt8 { return UInt8(v & 0xFF) }

func abMasked(op: UInt8, payload: Array<UInt8>, fin: Bool): Array<UInt8> {
    let maskKey: Array<UInt8> = [0x11, 0x22, 0x33, 0x44]
    var b0 = op
    if (fin) { b0 = b0 | 0x80 }
    let out = ArrayList<UInt8>()
    out.add(b0)
    let n = payload.size
    out.add(0x80 | abU8(n))
    for (b in maskKey) { out.add(b) }
    for (i in 0..n) { out.add(payload[i] ^ maskKey[i % 4]) }
    return out.toArray()
}

func abClose(code: Int64): Array<UInt8> {
    let p = Array<UInt8>(2, repeat: 0)
    p[0] = abU8(code >> 8); p[1] = abU8(code)
    return abMasked(0x88, p, true)
}

func abCloseWithPayload(code: Int64, reason: Array<UInt8>): Array<UInt8> {
    let p = ArrayList<UInt8>()
    p.add(abU8(code >> 8)); p.add(abU8(code))
    for (b in reason) { p.add(b) }
    return abMasked(0x88, p.toArray(), true)
}

func abReadExact(sock: TlsSocket, buf: Array<UInt8>): Bool {
    var got = 0
    while (got < buf.size) {
        let n = sock.read(buf[got..])
        if (n <= 0) { return false }
        got += n
    }
    return true
}

func abReadFrame(sock: TlsSocket): (Bool, UInt8, Array<UInt8>) {
    let h = Array<UInt8>(2, repeat: 0)
    if (!abReadExact(sock, h)) { return (false, 0, Array<UInt8>(0, repeat: 0)) }
    let op = h[0] & 0x0F
    var len = Int64(h[1] & 0x7F)
    if ((h[1] & 0x80) != 0) { return (true, 0xFF, h) }
    if (len == 126) {
        let e = Array<UInt8>(2, repeat: 0)
        if (!abReadExact(sock, e)) { return (false, 0, Array<UInt8>(0, repeat: 0)) }
        len = (Int64(e[0]) << 8) + Int64(e[1])
    } else if (len == 127) {
        let e = Array<UInt8>(8, repeat: 0)
        if (!abReadExact(sock, e)) { return (false, 0, Array<UInt8>(0, repeat: 0)) }
        len = (Int64(e[1]) << 16) + (Int64(e[2]) << 8) + Int64(e[3])
    }
    let payload = Array<UInt8>(len, repeat: 0)
    if (len > 0) {
        if (!abReadExact(sock, payload)) { return (false, 0, Array<UInt8>(0, repeat: 0)) }
    }
    return (true, op, payload)
}

func abCollect(sock: TlsSocket, waitMs: Int64): (Bool, Bool, Int64, Bool, UInt8, Array<UInt8>) {
    let deadline = DateTime.now() + Duration.millisecond * waitMs
    var eof = false
    var timedOut = false
    var closeCode = -1
    var pongSeen = false
    var lastOp: UInt8 = 0
    let reassembled = ArrayList<UInt8>()
    while (DateTime.now() < deadline) {
        var rr = (false, 0u8, Array<UInt8>(0, repeat: 0))
        var timeout = false
        try {
            rr = abReadFrame(sock)
        } catch (e: Exception) {
            timeout = true
        }
        if (timeout) { timedOut = true; break }
        let (ok, op, payload) = rr
        if (!ok) { eof = true; break }
        if (op == 0xFF) {
            lastOp = 0xFF
            reassembled.clear()
            for (b in payload) { reassembled.add(b) }
            break
        }
        if (op == 0x88) {
            if (payload.size >= 2) {
                closeCode = (Int64(payload[0]) << 8) + Int64(payload[1])
            } else { closeCode = 1005 }
            break
        }
        if (op == 0x8A) { pongSeen = true }
        if (op == 0x89) {
            try { sock.write(abMasked(0x8A, payload, true)) } catch (e: Exception) { () }
        }
        if (op == 0x1 || op == 0x2) {
            lastOp = op
            reassembled.clear()
            for (b in payload) { reassembled.add(b) }
        }
        if (op == 0x0) {
            for (b in payload) { reassembled.add(b) }
        }
    }
    return (eof, timedOut, closeCode, pongSeen, lastOp, reassembled.toArray())
}

func abHandshake(port: Int64): TlsSocket {
    let key = "dGhlIHNhbXBsZSBub25jZQ=="
    let tcp = TcpSocket("127.0.0.1", UInt16(port))
    tcp.connect()
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    ccfg.supportedAlpnProtocols = ["http/1.1"]
    let ts = TlsSocket.client(tcp, clientConfig: ccfg)
    ts.handshake()
    ts.readTimeout = Duration.second * 5
    ts.write("GET / HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Version: 13\r\n\r\n".toArray())
    let acc = ArrayList<UInt8>()
    let tmp = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = ts.read(tmp)
        if (n <= 0) { break }
        for (i in 0..n) { acc.add(tmp[i]) }
        if (String.fromUtf8(acc.toArray()).contains("\r\n\r\n")) { break }
    }
    let resp = String.fromUtf8(acc.toArray())
    if (!resp.startsWith("HTTP/1.1 101") && !resp.startsWith("HTTP/1.0 101")) {
        ts.close()
        throw Exception("handshake failed: ${resp.split("\r\n")[0]}")
    }
    return ts
}

func abCloseConn(sock: TlsSocket): Unit {
    try { sock.write(abClose(1000)) } catch (e: Exception) { () }
    try { sock.close() } catch (e: Exception) { () }
}

func abStartServer(): (Server, Int64) {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(abPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(abPem("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["http/1.1"]
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
    s.distributor.register("/", { ctx =>
        let w = WebSocket.upgradeFromServer(ctx)
        while (true) {
            let f = w.read()
            if (f.frameType == CloseWebFrame) {
                w.write(CloseWebFrame, f.payload)
                return
            }
            if (f.frameType == PingWebFrame) {
                w.writePongFrame(f.payload)
                continue
            }
            w.write(f.frameType, f.payload)
        }
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return (s, Int64(s.port))
}

func abBytes(list: Array<Int64>): Array<UInt8> {
    let a = Array<UInt8>(list.size, repeat: 0)
    for (i in 0..list.size) { a[i] = abU8(list[i]) }
    return a
}

@Test
class WsAutobahnCore {
    // GREEN: single-frame text echo works (guard against over-fix of issue 61)
    @TestCase
    func singleFrameEchoWorks(): Unit {
        let (s, port) = abStartServer()
        let sock = abHandshake(port)
        let payload = "single frame echo".toArray()
        sock.write(abMasked(0x1, payload, true))
        let (eof, timedOut, closeCode, _, lastOp, reassembled) = abCollect(sock, 3000)
        abCloseConn(sock)
        s.close()
        println("[ab] single echo => eof=${eof} to=${timedOut} cc=${closeCode} lastOp=${lastOp} got=${reassembled.size}B")
        @Expect(lastOp, 0x1)
        @Expect(reassembled.size, payload.size)
    }

    // RED (issue 61): fragmented message echo must deliver the FULL payload
    @TestCase
    func fragmentedEchoDeliveredCompletely(): Unit {
        let (s, port) = abStartServer()
        let sock = abHandshake(port)
        let p1 = Array<UInt8>(13, repeat: 0x61)
        let p2 = Array<UInt8>(13, repeat: 0x62)
        sock.write(abMasked(0x1, p1, false))
        sock.write(abMasked(0x0, p2, true))
        let (eof, timedOut, closeCode, _, lastOp, reassembled) = abCollect(sock, 3000)
        abCloseConn(sock)
        s.close()
        println("[ab61-frag] => eof=${eof} to=${timedOut} cc=${closeCode} lastOp=${lastOp} got=${reassembled.size}B want=26B")
        @Expect(lastOp, 0x1)
        @Expect(reassembled.size, 26)
    }

    // RED (issue 61): Ping must be answered with Pong (F32 fix regression check on TLS path)
    @TestCase
    func pingPongDelivered(): Unit {
        let (s, port) = abStartServer()
        let sock = abHandshake(port)
        sock.write(abMasked(0x89, "ping-payload".toArray(), true))
        let (eof, timedOut, closeCode, pongSeen, lastOp, _) = abCollect(sock, 3000)
        abCloseConn(sock)
        s.close()
        println("[ab61-ping] => eof=${eof} to=${timedOut} cc=${closeCode} pong=${pongSeen} lastOp=${lastOp}")
        @Expect(pongSeen, true)
    }

    // RED (issue 61): valid Close(1000) must be echoed back
    @TestCase
    func closeEchoDelivered(): Unit {
        let (s, port) = abStartServer()
        let sock = abHandshake(port)
        sock.write(abClose(1000))
        let (eof, timedOut, closeCode, _, lastOp, _) = abCollect(sock, 3000)
        abCloseConn(sock)
        s.close()
        println("[ab61-close] => eof=${eof} to=${timedOut} cc=${closeCode} lastOp=${lastOp}")
        @Expect(closeCode, 1000)
    }

    // RED (issue 47 family): oversized close payload (124B) — must fail with close 1002,
    // actual: TCP FIN without any close frame
    @TestCase
    func oversizedClosePayloadFin(): Unit {
        let (s, port) = abStartServer()
        let sock = abHandshake(port)
        sock.write(abCloseWithPayload(1000, Array<UInt8>(124, repeat: 0x63)))
        let (eof, timedOut, closeCode, _, lastOp, _) = abCollect(sock, 2500)
        abCloseConn(sock)
        s.close()
        println("[ab47-7.3.5] => eof=${eof} to=${timedOut} cc=${closeCode} lastOp=${lastOp}")
        @Expect(closeCode, 1002)
    }

    // RED (issue 47 family): invalid close code 999 — must fail with close 1002,
    // actual: TCP FIN without any close frame
    @TestCase
    func invalidCloseCodeFin(): Unit {
        let (s, port) = abStartServer()
        let sock = abHandshake(port)
        sock.write(abClose(999))
        let (eof, timedOut, closeCode, _, lastOp, _) = abCollect(sock, 2500)
        abCloseConn(sock)
        s.close()
        println("[ab47-7.9.2] => eof=${eof} to=${timedOut} cc=${closeCode} lastOp=${lastOp}")
        @Expect(closeCode, 1002)
    }
}
