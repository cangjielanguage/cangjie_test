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
import std.net.*
import std.io.*
import std.convert.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func sdReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(8192, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func sdStartEchoSrv(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/echo", { ctx =>
        let sb = StringBuilder()
        for ((name, values) in ctx.request.headers) {
            for (v in values) { sb.append("${name}=[${v}]\n") }
        }
        let body = sdReadAll(ctx.request.body)
        sb.append("METHOD=${ctx.request.method}\nBODY=[${String.fromUtf8(body)}]\n")
        ctx.responseBuilder.body(sb.toString())
    })
    s.distributor.register("/smuggled", { ctx =>
        let body = sdReadAll(ctx.request.body)
        ctx.responseBuilder.body("SMUGGLED-PROCESSED m=${ctx.request.method} b=[${String.fromUtf8(body)}]")
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func sdRawProbe(port: Int64, payload: String): String {
    let sock = TcpSocket("127.0.0.1", UInt16(port))
    sock.connect()
    sock.write(payload.toArray())
    let parts = ArrayList<String>()
    let done = AtomicBool(false)
    spawn {
        let buf = Array<UInt8>(16384, repeat: 0)
        while (!done.load()) {
            var n = 0
            var err = false
            try { n = sock.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            parts.add(String.fromUtf8(buf[0..n]))
        }
        done.store(true)
    }
    var waited: Int64 = 0
    while (!done.load() && waited < 3000) { sleep(Duration.millisecond * 100); waited += 100 }
    done.store(true)
    sleep(Duration.millisecond * 50)
    try { sock.close() } catch (e: Exception) { () }
    var reply = ""
    for (p in parts) { reply = reply + p }
    return reply
}

func sdDesync(reply: String): Bool {
    return reply.contains("SMUGGLED-PROCESSED")
}

func sdBodyEchoed(reply: String): Bool {
    return reply.contains("BODY=[AAAAA]")
}

func sdDrainRequest(sock: TcpSocket): Unit {
    let buf = Array<UInt8>(8192, repeat: 0)
    var head = ""
    while (!head.contains("\r\n\r\n")) {
        let n = sock.read(buf)
        if (n <= 0) { return }
        head = head + String.fromUtf8(buf[0..n])
    }
}

func sdStartScripted(responses: Array<String>): (TcpServerSocket, Int64) {
    let listener = TcpServerSocket(bindAt: 0)
    listener.bind()
    spawn {
        while (true) {
            try {
                let sock = listener.accept()
                spawn {
                    try {
                        for (r in responses) {
                            sdDrainRequest(sock)
                            sock.write(r.toArray())
                            sleep(Duration.millisecond * 200)
                        }
                        sleep(Duration.millisecond * 900)
                        sock.close()
                    } catch (e: Exception) { () }
                }
            } catch (e: Exception) { return }
        }
    }
    var port: Int64 = 0
    while (port == 0) {
        sleep(Duration.millisecond)
        let t = listener.localAddress.toString()
        match (t.lastIndexOf(":")) {
            case Some(i) => port = Int64.parse(t[i + 1..])
            case None => ()
        }
    }
    return (listener, port)
}

@Test
class HuntSmugglingDefense {
    var server: Server
    var port: Int64

    init() {
        server = sdStartEchoSrv()
        port = Int64(server.port)
    }

    ~init() {
        server.close()
    }

    @TestCase
    func sd01_teTabBeforeColon(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nTransfer-Encoding\t: chunked\r\n\r\n5\r\nAAAAA\r\n0\r\n\r\n")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd02_teChunkExtRejected(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: chunked; x=y\r\n\r\n5\r\nAAAAA\r\n0\r\n\r\n")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd03_teXchunked(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: xchunked\r\n\r\n5\r\nAAAAA\r\n0\r\n\r\n")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd04_teDoubleToken(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: chunked chunked\r\n\r\n5\r\nAAAAA\r\n0\r\n\r\n")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd05_teThenCl(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: chunked\r\nContent-Length: 6\r\n\r\n0\r\n\r\nGET /smuggled HTTP/1.1\r\nHost: x\r\n\r\n")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd06_twoClIdenticalNoDesync(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nContent-Length: 6\r\nContent-Length: 6\r\n\r\nAAAAAA")
        @Expect(sdDesync(reply), false)
    }

    @TestCase
    func sd07_clCommaList(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nContent-Length: 6, 6\r\n\r\nAAAAAA")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd08_clPlus(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nContent-Length: +6\r\n\r\nAAAAAA")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd09_clHex(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nContent-Length: 0x6\r\n\r\nAAAAAA")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd10_clOverflow(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nContent-Length: 99999999999999999999999\r\n\r\nAAAAAA")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd11_clTeDesync(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nContent-Length: 34\r\nTransfer-Encoding: chunked\r\n\r\n0\r\n\r\nGET /smuggled HTTP/1.1\r\nHost: x\r\n\r\n")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd12_teClDesync(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: chunked\r\nContent-Length: 5\r\n\r\n23\r\nGET /smuggled HTTP/1.1\r\nHost: x\r\n\r\n0\r\n\r\n")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd13_unterminatedChunked(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nAAAAA\r\nGET /smuggled HTTP/1.1\r\nHost: x\r\n\r\n")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd14_chunkSizeOverflow(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: chunked\r\n\r\nFFFFFFFFFFFFFFFF\r\nAAAAA\r\n0\r\n\r\n")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd15_chunkSizeGarbage(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: chunked\r\n\r\n5x\r\nAAAAA\r\n0\r\n\r\n")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd16_chunkNegative(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: chunked\r\n\r\n-5\r\nAAAAA\r\n0\r\n\r\n")
        @Expect(sdDesync(reply), false)
        @Expect(sdBodyEchoed(reply), false)
    }

    @TestCase
    func sd17_lfOnlyNoDesync(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\nHost: a\nTransfer-Encoding: chunked\n\n5\nAAAAA\n0\n\n")
        @Expect(sdDesync(reply), false)
    }

    @TestCase
    func sd18_mixedLfNoDesync(): Unit {
        let reply = sdRawProbe(port, "POST /echo HTTP/1.1\r\nHost: a\r\nTransfer-Encoding: chunked\n\n5\nAAAAA\n0\n\n")
        @Expect(sdDesync(reply), false)
    }

    @TestCase
    func sd19_respTwoClDifferentRejected(): Unit {
        let (listener, lport) = sdStartScripted([
            "HTTP/1.1 200 OK\r\nContent-Length: 5\r\nContent-Length: 100\r\n\r\nhello"])
        let client = ClientBuilder().readTimeout(4 * Duration.second).build()
        var rejected = false
        try {
            let resp = client.get("http://127.0.0.1:${lport}/x")
            let b = String.fromUtf8(sdReadAll(resp.body))
            if (!b.contains("hello")) { rejected = true }
        } catch (e: Exception) {
            rejected = true
        }
        client.close()
        listener.close()
        @Expect(rejected, true)
    }

    @TestCase
    func sd20_respHugeChunkDeclNoHang(): Unit {
        let (listener, lport) = sdStartScripted([
            "HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\nFFFFFFFFFFFFFFFF\r\nAAAA"])
        let client = ClientBuilder().readTimeout(4 * Duration.second).build()
        var timedOut = false
        try {
            let resp = client.get("http://127.0.0.1:${lport}/x")
            let b = String.fromUtf8(sdReadAll(resp.body))
            println("[SD20] body=[${b}]")
        } catch (e: Exception) {
            if ("${e}".contains("Timeout")) { timedOut = true }
        }
        client.close()
        listener.close()
        @Expect(timedOut, false)
    }
}
