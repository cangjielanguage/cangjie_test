/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../../okhttp_support
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl okhttp_support/common.cj %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt --parallel=false

import stdx.net.http.*
import std.net.*
import std.io.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

let WSMASK = [0x11u8, 0x22u8, 0x33u8, 0x44u8]

func buildFrame(first: UInt8, payload: Array<UInt8>, doMask: Bool): Array<UInt8> {
    let out = ArrayList<UInt8>()
    let maskBit: UInt8 = if (doMask) { 0x80u8 } else { 0x00u8 }
    let len = Int64(payload.size)
    out.add(first)
    if (len <= 125) {
        out.add(maskBit + UInt8(len))
    } else if (len <= 65535) {
        out.add(maskBit + 126u8)
        out.add(UInt8((len >> 8) & 0xFF))
        out.add(UInt8(len & 0xFF))
    } else {
        out.add(maskBit + 127u8)
        for (shift in [56, 48, 40, 32, 24, 16, 8, 0]) {
            out.add(UInt8((len >> shift) & 0xFF))
        }
    }
    if (doMask) {
        for (m in WSMASK) {
            out.add(m)
        }
        for (i in 0..len) {
            out.add(payload[i] ^ WSMASK[i % 4])
        }
    } else {
        for (i in 0..len) {
            out.add(payload[i])
        }
    }
    return out.toArray()
}

func textFrame(payload: Array<UInt8>, doMask: Bool): Array<UInt8> {
    return buildFrame(0x81u8, payload, doMask)
}
func readServerFrame(sock: TcpSocket): (UInt8, Array<UInt8>, Bool) {
    let data = ArrayList<UInt8>()
    var ftype: UInt8 = 0u8
    while (true) {
        let h = Array<UInt8>(2, repeat: 0)
        var n = 0
        try {
            n = sock.read(h)
            if (n <= 0) { return (0u8, data.toArray(), true) }
            if (n == 1) {
                let b2 = Array<UInt8>(1, repeat: 0)
                let n1 = sock.read(b2)
                if (n1 <= 0) { return (0u8, data.toArray(), true) }
                h[1] = b2[0]
            }
        } catch (e: Exception) {
            return (0u8, data.toArray(), true)
        }
        let opcode = h[0] & 0x0Fu8
        let fin = (h[0] & 0x80u8) != 0u8
        let masked = (h[1] & 0x80u8) != 0u8
        var len = Int64(h[1] & 0x7Fu8)
        try {
            if (len == 126) {
                let e = Array<UInt8>(2, repeat: 0)
                sock.read(e)
                len = Int64(e[0]) * 256 + Int64(e[1])
            } else if (len == 127) {
                let e = Array<UInt8>(8, repeat: 0)
                sock.read(e)
                len = 0
                for (i in 0..8) { len = len * 256 + Int64(e[i]) }
            }
            var maskKey: Array<UInt8> = []
            if (masked) {
                let mk = Array<UInt8>(4, repeat: 0)
                sock.read(mk)
                maskKey = mk
            }
            let payload = Array<UInt8>(len, repeat: 0)
            var total = 0
            while (total < len) {
                let n2 = sock.read(payload[total..])
                if (n2 <= 0) { return (0u8, data.toArray(), true) }
                total += n2
            }
            if (maskKey.size == 4) {
                for (i in 0..total) { payload[i] = payload[i] ^ maskKey[i % 4] }
            }
            if (opcode == 0x08u8) { return (0x08u8, payload, false) }
            if (opcode == 0x09u8 || opcode == 0x0Au8) { continue }
            if (ftype == 0u8 && opcode != 0x00u8) { ftype = opcode }
            for (b in payload) { data.add(b) }
            if (fin) { return (ftype, data.toArray(), false) }
        } catch (e: Exception) {
            return (0u8, data.toArray(), true)
        }
    }
    return (0u8, data.toArray(), true)
}

func wsConnect(port: UInt16): TcpSocket {
    let sock = TcpSocket(IPSocketAddress("127.0.0.1", UInt16(port)))
    sock.connect()
    let hs = "GET /ws HTTP/1.1\r\nHost: 127.0.0.1:${port}\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Key: MDEyMzQ1Njc4OWFiY2RlZg==\r\nSec-WebSocket-Version: 13\r\n\r\n"
    sock.write(hs.toArray())
    let buf = Array<UInt8>(8192, repeat: 0)
    var head = ""
    while (true) {
        let n = sock.read(buf)
        if (n <= 0) {
            break
        }
        head = head + String.fromUtf8(buf[0..n])
        if (head.contains("\r\n\r\n")) {
            break
        }
    }
    return sock
}

func startWsEchoServer(): Server {
    return startServer({
        s => s.distributor.register("/ws", {
            ctx =>
            let ws = WebSocket.upgradeFromServer(ctx)
            while (true) {
                let data = ArrayList<UInt8>()
                var msgType: WebSocketFrameType = TextWebFrame
                var done = false
                while (!done) {
                    let f = ws.read()
                    if (f.frameType == PingWebFrame) {
                        ws.writePongFrame(f.payload)
                        continue
                    }
                    if (f.frameType == CloseWebFrame) {
                        ws.write(CloseWebFrame, f.payload, frameSize: 4096)
                        ws.closeConn()
                        return
                    }
                    if (f.frameType == PongWebFrame) {
                        continue
                    }
                    if (f.frameType != ContinuationWebFrame) {
                        msgType = f.frameType
                    }
                    for (b in f.payload) {
                        data.add(b)
                    }
                    if (f.fin) {
                        done = true
                    }
                }
                ws.write(msgType, data.toArray(), frameSize: 4096)
            }
        })
    })
}
func expectConnectionFail(sock: TcpSocket): Unit {
    let (op, pl, eof) = readServerFrame(sock)
    if (eof) {
        @Expect(1, 1)
        return
    }
    @Expect(op, 0x08u8)
}

@Test
class WsConformanceTest {
    @TestCase
    func textInvalidUtf8SingleByteFails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(textFrame([0xFFu8], true))
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }

    @TestCase
    func textInvalidUtf8SequenceFails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        let bad = [0xCEu8, 0xBAu8, 0xE1u8, 0xBDu8, 0xB9u8, 0xCEu8, 0xBDu8, 0xB9u8, 0xCEu8]
        sock.write(textFrame(bad, true))
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }

    @TestCase
    func textFragmentedInvalidUtf8InContinuationFails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0x01u8, [0xCEu8, 0xBAu8], true))            // fin=0, valid fragment
        sock.write(buildFrame(0x9Fu8, [0xE1u8, 0xBDu8, 0xB9u8, 0xCEu8], true)) // continuation, invalid
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }

    @TestCase
    func textFailOnFirstInvalidFragment(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0x01u8, [0xFFu8], true))                     // fin=0, invalid
        sock.write(buildFrame(0x9Fu8, [0xCEu8, 0xBAu8], true))             // continuation valid
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }
    @TestCase
    func fragmentedZeroLengthThenFinal(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0x01u8, [], true))
        sock.write(buildFrame(0x9Fu8, "hello".toArray(), true))
        let (op, pl, _) = readServerFrame(sock)
        @Expect(op, 0x01u8)
        @Expect(pl, "hello".toArray())
        sock.close()
        server.close()
    }
    @TestCase
    func continuationWithoutInitialFails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0x9Fu8, "orphan".toArray(), true))
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }
    @TestCase
    func unknownOpcode3Fails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0x83u8, [0x01u8], true))
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }

    @TestCase
    func unknownOpcode5Fails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0x85u8, [], true))
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }
    @TestCase
    func rsv1SetFails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0xC1u8, [0x41u8], true))   // FIN+RSV1+text
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }

    @TestCase
    func rsv2SetFails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0xA2u8, [0x41u8], true))   // FIN+RSV2+binary
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }

    @TestCase
    func rsv3SetFails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0x91u8, [0x41u8], true))   // FIN+RSV3+text
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }
    @TestCase
    func pingPayload126Fails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0x99u8, Array<UInt8>(126, repeat: 0x41), true))  // FIN+ping, 126B
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }
    @TestCase
    func pingPongEcho(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0x89u8, "ping-data".toArray(), true))
        let (op, pl, _) = readServerFrame(sock)
        @Expect(op, 0x0Au8)
        @Expect(pl, "ping-data".toArray())
        sock.close()
        server.close()
    }
    @TestCase
    func unsolicitedPongAccepted(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0x8Au8, "pong".toArray(), true))
        sock.write(buildFrame(0x81u8, "after-pong".toArray(), true))
        let (op, pl, _) = readServerFrame(sock)
        @Expect(op, 0x01u8)
        @Expect(pl, "after-pong".toArray())
        sock.close()
        server.close()
    }
    @TestCase
    func unmaskedClientTextFails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(textFrame("unmasked".toArray(), false))
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }
    @TestCase
    func maskedTextEchoBaseline(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(textFrame("masked-ok".toArray(), true))
        let (op, pl, _) = readServerFrame(sock)
        @Expect(op, 0x01u8)
        @Expect(pl, "masked-ok".toArray())
        sock.close()
        server.close()
    }
    @TestCase
    func closeCode1000Echoed(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        let cl = buildFrame(0x88u8, [0x03u8, 0xE8u8], true)   // status 1000
        sock.write(cl)
        let (op, pl, _) = readServerFrame(sock)
        @Expect(op, 0x08u8)
        @Expect(pl.size, 2)
        sock.close()
        server.close()
    }
    @TestCase
    func closeCode999Fails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        let cl = buildFrame(0x88u8, [0x03u8, 0xE7u8], true)   // status 999 (invalid)
        sock.write(cl)
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }

    @TestCase
    func closeCode1004Fails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        let cl = buildFrame(0x88u8, [0x03u8, 0xECu8], true)   // status 1004 (invalid)
        sock.write(cl)
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }
    @TestCase
    func closeReasonInvalidUtf8Fails(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        let reason: Array<UInt8> = [0xCEu8, 0xBAu8, 0xE1u8]   // invalid sequence tail
        let payload = ArrayList<UInt8>()
        payload.add(0x03u8)
        payload.add(0xE8u8)
        for (b in reason) {
            payload.add(b)
        }
        let cl = buildFrame(0x88u8, payload.toArray(), true)
        sock.write(cl)
        expectConnectionFail(sock)
        sock.close()
        server.close()
    }
    @TestCase
    func framesAfterCloseIgnored(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        sock.write(buildFrame(0x88u8, [0x03u8, 0xE8u8], true))
        let (op, _, _) = readServerFrame(sock)
        @Expect(op, 0x08u8)
        sock.write(textFrame("after-close".toArray(), true))
        sock.close()
        server.close()
    }
    @TestCase
    func payload126Boundary(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        let payload = Array<UInt8>(126, repeat: 0x42)
        sock.write(textFrame(payload, true))
        let (op, pl, _) = readServerFrame(sock)
        @Expect(op, 0x01u8)
        @Expect(pl, payload)
        sock.close()
        server.close()
    }
    @TestCase
    func payload65536Boundary(): Unit {
        let server = startWsEchoServer()
        let sock = wsConnect(server.port)
        let payload = Array<UInt8>(65536, repeat: 0x43)
        sock.write(textFrame(payload, true))
        let (op, pl, _) = readServerFrame(sock)
        @Expect(op, 0x01u8)
        @Expect(pl, payload)
        sock.close()
        server.close()
    }
}
