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
import stdx.crypto.digest.*
import stdx.encoding.base64.*
import stdx.encoding.url.*
import std.net.*
import std.io.*
import std.convert.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

class ReplyBox {
    var v: String = ""
}

func wu8p(v: Int64): UInt8 { return UInt8(v & 0xFF) }

func wsFrameP2(opcode: UInt8, payload: Array<UInt8>, fin: Bool, mask: Bool, rsv1: Bool): Array<UInt8> {
    let out = ArrayList<UInt8>()
    let finBit: Int64 = if (fin) { 0x80 } else { 0x00 }
    let rsvBit: Int64 = if (rsv1) { 0x40 } else { 0x00 }
    out.add(wu8p(finBit | rsvBit | Int64(opcode)))
    let maskBit: Int64 = if (mask) { 0x80 } else { 0x00 }
    let len = payload.size
    if (len < 126) {
        out.add(wu8p(maskBit | Int64(len)))
    } else {
        out.add(wu8p(maskBit | 126))
        out.add(wu8p(len >> 8)); out.add(wu8p(len))
    }
    if (mask) {
        let key: Array<UInt8> = [0x12, 0x34, 0x56, 0x78]
        for (k in key) { out.add(k) }
        var i = 0
        while (i < len) { out.add(wu8p(Int64(payload[i]) ^ Int64(key[i % 4]))); i += 1 }
    } else {
        for (b in payload) { out.add(b) }
    }
    return out.toArray()
}

class HeadBox {
    var v: String = ""
}

func wsAcceptKeyP2(key: String): String {
    let sha = SHA1()
    sha.write((key + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11").toArray())
    return toBase64String(sha.finish())
}

func pemP2(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func startWsServerP2(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/ws", { ctx =>
        let w = WebSocket.upgradeFromServer(ctx)
        try {
            while (true) {
                let frame = w.read()
                w.writePongFrame(frame.payload)
            }
        } catch (e: Exception) { () }
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func wsHandshakeP2(port: Int64): TcpSocket {
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

@Test
class HuntWsPmdGuards {
    @TestCase
    func clientDoesNotOfferPmd(): Unit {
        let s = startWsServerP2()
        let port = Int64(s.port)
        let sock = wsHandshakeP2(port)
        sock.close()
        s.close()
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        var lport: Int64 = 0
        while (lport == 0) {
            sleep(Duration.millisecond)
            let t = listener.localAddress.toString()
            match (t.lastIndexOf(":")) {
                case Some(i) => lport = Int64.parse(t[i + 1..])
                case None => ()
            }
        }
        let headBox = HeadBox()
        let done = AtomicBool(false)
        spawn {
            try {
                let tcp = listener.accept()
                let buf = Array<UInt8>(4096, repeat: 0)
                while (!headBox.v.contains("\r\n\r\n")) {
                    var n = 0
                    var err = false
                    try { n = tcp.read(buf) } catch (e: Exception) { err = true }
                    if (err || n <= 0) { break }
                    headBox.v = headBox.v + String.fromUtf8(buf[0..n])
                }
                var key = ""
                for (line in headBox.v.split("\r\n")) {
                    if (line.startsWith("sec-websocket-key:") || line.startsWith("Sec-WebSocket-Key:")) {
                        var v = line[18..]
                        while (v.size > 0 && (v[0] == UInt8(32) || v.startsWith("\t"))) { v = v[1..] }
                        key = v
                    }
                }
                let accept = wsAcceptKeyP2(key)
                tcp.write("HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: ${accept}\r\n\r\n".toArray())
                tcp.flush()
                sleep(Duration.millisecond * 800)
                try { tcp.close() } catch (e: Exception) { () }
            } catch (e: Exception) { () }
            done.store(true)
        }
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(4 * Duration.second).build()
        try {
            let (ws, _) = WebSocket.upgradeFromClient(c, URL.parse("ws://127.0.0.1:${lport}/ws"))
            sleep(Duration.millisecond * 900)
        } catch (e: Exception) { () }
        c.close()
        done.store(true)
        listener.close()
        println("[PD-G1] offersPermessageDeflate=${headBox.v.contains("permessage-deflate")}")
        @Expect(headBox.v.contains("permessage-deflate"), false)
    }

    @TestCase
    func serverDoesNotEchoPmd(): Unit {
        let s = startWsServerP2()
        let port = Int64(s.port)
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        let req = "GET /ws HTTP/1.1\r\nHost: a\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Version: 13\r\nSec-WebSocket-Extensions: permessage-deflate; client_max_window_bits\r\n\r\n"
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
        sock.close()
        s.close()
        println("[PD-G2] 101 reply=[${reply.replace("\r\n", " | ")}]")
        @Expect(reply.contains("101"), true)
        @Expect(reply.contains("permessage-deflate"), false)
    }

    @TestCase
    func rsv1FrameRejected(): Unit {
        let s = startWsServerP2()
        let port = Int64(s.port)
        let excSeen = AtomicBool(false)
        let got101 = AtomicBool(false)
        s.distributor.register("/ws-rsv", { ctx =>
            let w = WebSocket.upgradeFromServer(ctx)
            try {
                let frame = w.read()
                println("[PD-G3] server read frame OK (unexpected)")
            } catch (e: Exception) {
                excSeen.store(true)
            }
        })
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        let req = "GET /ws-rsv HTTP/1.1\r\nHost: a\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==\r\nSec-WebSocket-Version: 13\r\n\r\n"
        sock.write(req.toArray())
        sock.flush()
        sleep(Duration.millisecond * 100)
        sock.write(wsFrameP2(0x1, [0x78, 0x9C, 0xCB, 0x48], true, true, true))
        sock.flush()
        let replyBox = ReplyBox()
        let done = AtomicBool(false)
        spawn {
            let buf = Array<UInt8>(4096, repeat: 0)
            while (!done.load()) {
                var n = 0
                var err = false
                try { n = sock.read(buf) } catch (e: Exception) { err = true }
                if (err || n <= 0) { break }
                var i = 0
                while (i < n) {
                    let b = buf[i]
                    if ((b >= 0x20 && b <= 0x7E) || b == 0x0D || b == 0x0A) {
                        replyBox.v = replyBox.v + String.fromUtf8([b])
                    }
                    i += 1
                }
                if (replyBox.v.contains("101")) { got101.store(true) }
            }
        }
        var w: Int64 = 0
        while (w < 8000) { sleep(Duration.millisecond * 50); w += 50 }
        done.store(true)
        sleep(Duration.millisecond * 200)
        try { sock.close() } catch (e: Exception) { () }
        s.close()
        println("[PD-G3] got101=${got101.load()} rsv1Rejected=${excSeen.load()}")
        @Expect(got101.load(), true)
        @Expect(excSeen.load(), true)
    }
}
