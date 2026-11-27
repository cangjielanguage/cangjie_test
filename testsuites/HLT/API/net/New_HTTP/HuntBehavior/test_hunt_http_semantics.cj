/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:
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

func hsReadBody(resp: HttpResponse): String {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(8192, repeat: 0)
    while (true) {
        let n = resp.body.read(chunk)
        if (n <= 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return String.fromUtf8(buffer.toArray())
}

func iminhfs(a: Int64, b: Int64): Int64 { if (a < b) { a } else { b } }

func hsTrimTo(s: String, maxLen: Int64): String {
    if (s.size <= maxLen) { return s }
    return s[..maxLen]
}

func hsStartRawServer(response: String): (TcpServerSocket, Int64) {
    let listener = TcpServerSocket(bindAt: 0)
    listener.bind()
    var port: Int64 = 0
    while (port == 0) {
        sleep(Duration.millisecond)
        let t = listener.localAddress.toString()
        match (t.lastIndexOf(":")) {
            case Some(i) => port = Int64.parse(t[i + 1..])
            case None => ()
        }
    }
    spawn {
        try {
            let sock = listener.accept()
            let buf = Array<UInt8>(4096, repeat: 0)
            while (true) {
                var n = 0
                var err = false
                try { n = sock.read(buf) } catch (e: Exception) { err = true }
                if (err || n <= 0) { break }
                if (String.fromUtf8(buf[0..n]).contains("\r\n\r\n")) { break }
            }
            sock.write(response.toArray())
            sock.close()
        } catch (e: Exception) { () }
    }
    return (listener, port)
}

func hsClient(): Client {
    return ClientBuilder().readTimeout(5 * Duration.second).build()
}

func hsGet(port: Int64, path: String): (String, String) {
    let c = hsClient()
    var status = "?"
    var body = "?"
    try {
        let r = c.get("http://127.0.0.1:${port}${path}")
        status = "${r.status}"
        body = hsReadBody(r)
    } catch (e: Exception) {
        status = "EXC"
        body = "${e}"
    }
    c.close()
    return (status, body)
}

@Test
class HuntHttpSemantics {
    @TestCase
    func clTeResponseChunkedDecoded(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.1 200 OK\r\nContent-Length: 100\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nhello\r\n0\r\n\r\n")
        let (status, body) = hsGet(port, "/")
        listener.close()
        println("[CL+TE] status=${status} body=[${body}]")
        @Expect(status, "200")
        @Expect(body, "hello")
    }

    @TestCase
    func teOnlyResponseProcessed(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nhello\r\n0\r\n\r\n")
        let (status, body) = hsGet(port, "/")
        listener.close()
        @Expect(status, "200")
        @Expect(body, "hello")
    }

    @TestCase
    func clOnlyResponseProcessed(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.1 200 OK\r\nContent-Length: 5\r\n\r\nhello")
        let (status, body) = hsGet(port, "/")
        listener.close()
        @Expect(status, "200")
        @Expect(body, "hello")
    }

    @TestCase
    func http10ResponseAccepted(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.0 200 OK\r\nContent-Length: 5\r\n\r\nhello")
        let (status, body) = hsGet(port, "/")
        listener.close()
        @Expect(status, "200")
        @Expect(body, "hello")
    }

    @TestCase
    func eofDelimitedBody(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.1 200 OK\r\nConnection: close\r\n\r\nclose-delimited-body")
        let (status, body) = hsGet(port, "/")
        listener.close()
        @Expect(status, "200")
        @Expect(body, "close-delimited-body")
    }

    @TestCase
    func chunkedWithTrailer(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n5\r\nhello\r\n0\r\nX-Trailer: v\r\n\r\n")
        let (status, body) = hsGet(port, "/")
        listener.close()
        @Expect(status, "200")
        @Expect(body, "hello")
    }

    @TestCase
    func chunkedWithExtension(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n5;foo=bar\r\nhello\r\n0\r\n\r\n")
        let (status, body) = hsGet(port, "/")
        listener.close()
        @Expect(status, "200")
        @Expect(body, "hello")
    }

    @TestCase
    func informational100Skipped(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.1 100 Continue\r\n\r\nHTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nok")
        let (status, body) = hsGet(port, "/")
        listener.close()
        @Expect(status, "200")
        @Expect(body, "ok")
    }

    @TestCase
    func earlyHints103Skipped(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.1 103 Early Hints\r\nLink: </style.css>\r\n\r\nHTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nok")
        let (status, body) = hsGet(port, "/")
        listener.close()
        @Expect(status, "200")
        @Expect(body, "ok")
    }

    @TestCase
    func emptyChunkedBody(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.1 200 OK\r\nTransfer-Encoding: chunked\r\n\r\n0\r\n\r\n")
        let (status, body) = hsGet(port, "/")
        listener.close()
        @Expect(status, "200")
        @Expect(body, "")
    }

    @TestCase
    func contentLengthZero(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n")
        let (status, body) = hsGet(port, "/")
        listener.close()
        @Expect(status, "200")
        @Expect(body, "")
    }

    @TestCase
    func noReasonPhrase(): Unit {
        let (listener, port) = hsStartRawServer(
            "HTTP/1.1 200\r\nContent-Length: 2\r\n\r\nok")
        let (status, body) = hsGet(port, "/")
        listener.close()
        @Expect(status, "200")
        @Expect(body, "ok")
    }

    @TestCase
    func duplicateHeadersBothVisible(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/echo", { ctx =>
            var hdrStr = ""
            for ((name, values) in ctx.request.headers) {
                for (v in values) { hdrStr = hdrStr + "${name}=${v}; " }
            }
            ctx.responseBuilder.body("hdr=[${hdrStr}]")
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
        let port = Int64(server.port)
        let tcp = TcpSocket("127.0.0.1", UInt16(port))
        tcp.connect()
        tcp.write("GET /echo HTTP/1.1\r\nHost: a\r\nConnection: close\r\nX-Multi: v1\r\nX-Multi: v2\r\n\r\n".toArray())
        let buf = Array<UInt8>(65536, repeat: 0)
        var reply = ""
        while (true) {
            var n = 0
            var err = false
            try { n = tcp.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            reply = reply + String.fromUtf8(buf[0..n])
        }
        tcp.close()
        server.close()
        println("[DUP-HDR] reply=[${reply}]")
        @Expect(reply.contains("x-multi=v1"), true)
        @Expect(reply.contains("x-multi=v2"), true)
    }

    @TestCase
    func headerNoSpaceAfterColon(): Unit {
        let server = ServerBuilder().addr("127.0.0.1").port(0).build()
        server.distributor.register("/echo", { ctx =>
            var hdrStr = ""
            for ((name, values) in ctx.request.headers) {
                for (v in values) { hdrStr = hdrStr + "${name}=${v}; " }
            }
            ctx.responseBuilder.body("hdr=[${hdrStr}]")
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
        let port = Int64(server.port)
        let tcp = TcpSocket("127.0.0.1", UInt16(port))
        tcp.connect()
        tcp.write("GET /echo HTTP/1.1\r\nHost: a\r\nConnection: close\r\nX-NoSpace:value\r\n\r\n".toArray())
        let buf = Array<UInt8>(65536, repeat: 0)
        var reply = ""
        while (true) {
            var n = 0
            var err = false
            try { n = tcp.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            reply = reply + String.fromUtf8(buf[0..n])
        }
        tcp.close()
        server.close()
        println("[NOSPACE] reply=[${reply}]")
        @Expect(reply.contains("x-nospace=value"), true)
    }
}
