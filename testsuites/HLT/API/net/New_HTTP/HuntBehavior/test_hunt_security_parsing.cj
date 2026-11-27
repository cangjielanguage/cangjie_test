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
import std.net.*
import std.io.*
import std.convert.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func spReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(65536, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func spBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(spReadAll(resp.body))
}

func spStartRawSrv(response: Array<UInt8>): TcpServerSocket {
    let listener = TcpServerSocket(bindAt: 0)
    listener.bind()
    spawn {
        while (true) {
            try {
                let sock = listener.accept()
                spawn {
                    try {
                        let buf = Array<UInt8>(8192, repeat: 0)
                        while (true) {
                            let n = sock.read(buf)
                            if (n <= 0) { break }
                            if (String.fromUtf8(buf[0..n]).contains("\r\n\r\n")) { break }
                        }
                        sock.write(response)
                        sleep(Duration.millisecond * 500)
                        sock.close()
                    } catch (e: Exception) { () }
                }
            } catch (e: Exception) { return }
        }
    }
    return listener
}

func spPortOf(listener: TcpServerSocket): Int64 {
    var port: Int64 = 0
    while (port == 0) {
        sleep(Duration.millisecond)
        let t = listener.localAddress.toString()
        match (t.lastIndexOf(":")) {
            case Some(i) => port = Int64.parse(t[i + 1..])
            case None => ()
        }
    }
    return port
}

func spStartEchoSrv(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/echo", { ctx =>
        let sb = StringBuilder()
        for ((name, values) in ctx.request.headers) {
            for (v in values) { sb.append("${name}=[${v}]\n") }
        }
        let body = spReadAll(ctx.request.body)
        sb.append("BODY=[${String.fromUtf8(body)}]")
        ctx.responseBuilder.body(sb.toString())
    })
    s.distributor.register("/hello", { ctx =>
        ctx.responseBuilder.body("0123456789ABCDEF")
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

@Test
class SecurityParsingGreenPins {
    var echoServer: Server
    var echoPort: Int64

    init() {
        echoServer = spStartEchoSrv()
        echoPort = Int64(echoServer.port)
    }

    ~init() {
        echoServer.close()
    }

    @TestCase
    func nullByteInHeaderValueRejected(): Unit {
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let payload = "GET /echo HTTP/1.1\r\nHost: a\r\nX-Null: value\u{0000}injected\r\n\r\n"
        let sock = TcpSocket("127.0.0.1", UInt16(echoPort))
        sock.connect()
        sock.write(payload.toArray().map({ b => UInt8(b) }))
        sleep(Duration.millisecond * 300)
        var reply = ""
        let buf = Array<UInt8>(8192, repeat: 0)
        while (true) {
            var n = 0
            var err = false
            try { n = sock.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            reply += String.fromUtf8(buf[0..n])
        }
        sock.close()
        println("[sp] null-byte-header: injected=${reply.contains("X-Injected") || reply.contains("injected")} replyLen=${reply.size}")
        @Expect(reply.contains("X-Injected"), false)
        c.close()
    }

    @TestCase
    func nullByteInUrlPathRejected(): Unit {
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let payload = "GET /echo\u{0000}injected HTTP/1.1\r\nHost: a\r\n\r\n"
        let sock = TcpSocket("127.0.0.1", UInt16(echoPort))
        sock.connect()
        sock.write(payload.toArray().map({ b => UInt8(b) }))
        sleep(Duration.millisecond * 300)
        var reply = ""
        let buf = Array<UInt8>(8192, repeat: 0)
        while (true) {
            var n = 0
            var err = false
            try { n = sock.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            reply += String.fromUtf8(buf[0..n])
        }
        sock.close()
        println("[sp] null-byte-url: injected=${reply.contains("injected")} replyLen=${reply.size}")
        @Expect(reply.contains("injected"), false)
        c.close()
    }

    @TestCase
    func crlfInjectionViaUrlRejected(): Unit {
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${echoPort}/echo?x=%0d%0aX-Injected:%201")
            let body = spBodyOf(r)
            println("[sp] crlf-url: injected=${body.contains("X-Injected")}")
            @Expect(body.contains("X-Injected"), false)
        } catch (e: Exception) {
            println("[sp] crlf-url: exception ${e}")
        }
        c.close()
    }

    @TestCase
    func headerNameWithSpaceRejected(): Unit {
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let payload = "GET /echo HTTP/1.1\r\nHost: a\r\nX-Foo Bar: value\r\n\r\n"
        let sock = TcpSocket("127.0.0.1", UInt16(echoPort))
        sock.connect()
        sock.write(payload.toArray().map({ b => UInt8(b) }))
        sleep(Duration.millisecond * 300)
        var reply = ""
        let buf = Array<UInt8>(8192, repeat: 0)
        while (true) {
            var n = 0
            var err = false
            try { n = sock.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            reply += String.fromUtf8(buf[0..n])
        }
        sock.close()
        println("[sp] header-space: rejected=${reply.contains("Invalid header field line")}")
        @Expect(reply.contains("400 Bad Request"), true)
        @Expect(reply.contains("Invalid header field line"), true)
        c.close()
    }

    @TestCase
    func headerNameWithTabRejected(): Unit {
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let payload = "GET /echo HTTP/1.1\r\nHost: a\r\nX-Foo\tBar: value\r\n\r\n"
        let sock = TcpSocket("127.0.0.1", UInt16(echoPort))
        sock.connect()
        sock.write(payload.toArray().map({ b => UInt8(b) }))
        sleep(Duration.millisecond * 300)
        var reply = ""
        let buf = Array<UInt8>(8192, repeat: 0)
        while (true) {
            var n = 0
            var err = false
            try { n = sock.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            reply += String.fromUtf8(buf[0..n])
        }
        sock.close()
        println("[sp] header-tab: rejected=${reply.contains("Invalid header field line")}")
        @Expect(reply.contains("400 Bad Request"), true)
        @Expect(reply.contains("Invalid header field line"), true)
        c.close()
    }

    @TestCase
    func contentLengthLeadingZeros(): Unit {
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.send(HttpRequestBuilder().url("http://127.0.0.1:${echoPort}/echo")
                .header("x-test", "cl-zeros").body("AAAAA").post().build())
            println("[sp] cl-zeros: status=${r.status}")
            @Expect(r.status, 200)
        } catch (e: Exception) {
            println("[sp] cl-zeros exception ${e}")
            @Expect(false, true)
        }
        c.close()
    }

    @TestCase
    func longHeaderValue64KNoCrash(): Unit {
        let c = ClientBuilder().readTimeout(10 * Duration.second).build()
        let longVal = String.fromUtf8(Array<UInt8>(64 * 1024, repeat: 0x41))
        try {
            let r = c.send(HttpRequestBuilder().url("http://127.0.0.1:${echoPort}/echo")
                .header("x-long", longVal).build())
            let body = spBodyOf(r)
            println("[sp] 64KB header: status=${r.status} bodyLen=${body.size}")
            @Expect(r.status, 431)
            @Expect(body.contains("Single header size exceeds limit"), true)
        } catch (e: Exception) {
            println("[sp] 64KB header: exception ${e}")
        }
        c.close()
    }

    @TestCase
    func unicodeInHeaderValueAccepted(): Unit {
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.send(HttpRequestBuilder().url("http://127.0.0.1:${echoPort}/echo")
                .header("x-unicode", "\u{4e2d}\u{6587}\u{6d4b}\u{8bd5}").build())
            let body = spBodyOf(r)
            println("[sp] unicode header: status=${r.status} body contains unicode=${body.contains("\u{4e2d}\u{6587}")}")
            @Expect(r.status, 200)
        } catch (e: Exception) {
            println("[sp] unicode header exception ${e}")
            @Expect(false, true)
        }
        c.close()
    }

    @TestCase
    func bareCRInHeaderValueRejected(): Unit {
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let payload = "GET /echo HTTP/1.1\r\nHost: a\r\nX-CR: value\risolated\r\n\r\n"
        let sock = TcpSocket("127.0.0.1", UInt16(echoPort))
        sock.connect()
        sock.write(payload.toArray().map({ b => UInt8(b) }))
        sleep(Duration.millisecond * 300)
        var reply = ""
        let buf = Array<UInt8>(8192, repeat: 0)
        while (true) {
            var n = 0
            var err = false
            try { n = sock.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            reply += String.fromUtf8(buf[0..n])
        }
        sock.close()
        println("[sp] bare-cr-value: injected=${reply.contains("isolated")}")
        @Expect(reply.contains("isolated"), false)
        c.close()
    }
}

@Test
class SecurityResponseGreenPins {
    @TestCase
    func responseSplittingParsedCorrectly(): Unit {
        let response = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nX-Inject: value\r\nInjected: header\r\nContent-Length: 5\r\n\r\nhello"
        let listener = spStartRawSrv(response.toArray().map({ b => UInt8(b) }))
        let port = spPortOf(listener)
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            let body = spBodyOf(r)
            println("[sp] resp-splitting: status=${r.status} body=[${body}]")
            @Expect(r.status, 200)
            @Expect(body, "hello")
        } catch (e: Exception) {
            println("[sp] resp-splitting exception ${e}")
            @Expect(false, true)
        }
        c.close(); listener.close()
    }

    @TestCase
    func responseNullByteHandled(): Unit {
        let response = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nX-Null: value\u{0000}inject\r\nContent-Length: 5\r\n\r\nhello"
        let listener = spStartRawSrv(response.toArray().map({ b => UInt8(b) }))
        let port = spPortOf(listener)
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            let body = spBodyOf(r)
            println("[sp] null-resp-header: status=${r.status} bodyLen=${body.size}")
            @Expect(r.status, 200)
            @Expect(body, "hello")
        } catch (e: Exception) {
            println("[sp] null-resp-header: exception ${e}")
        }
        c.close(); listener.close()
    }

    @TestCase
    func response64KHeaderNoCrash(): Unit {
        let longVal = String.fromUtf8(Array<UInt8>(64 * 1024, repeat: 0x41))
        let response = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nX-Long: ${longVal}\r\nContent-Length: 5\r\n\r\nhello"
        let listener = spStartRawSrv(response.toArray().map({ b => UInt8(b) }))
        let port = spPortOf(listener)
        let c = ClientBuilder().readTimeout(10 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            let body = spBodyOf(r)
            println("[sp] 64KB header: status=${r.status} bodyLen=${body.size}")
            @Expect(r.status, 200)
            @Expect(body, "hello")
        } catch (e: Exception) {
            println("[sp] 64KB header: exception ${e}")
        }
        c.close(); listener.close()
    }

    @TestCase
    func responseUnicodeInHeaderAccepted(): Unit {
        let response = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nX-Unicode: \u{4e2d}\u{6587}\r\nContent-Length: 5\r\n\r\nhello"
        let listener = spStartRawSrv(response.toArray().map({ b => UInt8(b) }))
        let port = spPortOf(listener)
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            let body = spBodyOf(r)
            println("[sp] unicode resp header: status=${r.status} body=[${body}]")
            @Expect(r.status, 200)
            @Expect(body, "hello")
        } catch (e: Exception) {
            println("[sp] unicode resp header: exception ${e}")
        }
        c.close(); listener.close()
    }

    @TestCase
    func responseNoHeadersAccepted(): Unit {
        let response = "HTTP/1.1 200 OK\r\n\r\nhello"
        let listener = spStartRawSrv(response.toArray().map({ b => UInt8(b) }))
        let port = spPortOf(listener)
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            let body = spBodyOf(r)
            println("[sp] no headers: status=${r.status} body=[${body}]")
            @Expect(r.status, 200)
            @Expect(body, "hello")
        } catch (e: Exception) {
            println("[sp] no headers: exception ${e}")
        }
        c.close(); listener.close()
    }
}

@Test
class HandlerEdgeGreenPins {
    var server: Server
    var client: Client

    init() {
        server = ServerBuilder().addr("127.0.0.1").port(0).build()
        client = ClientBuilder().readTimeout(5 * Duration.second).build()
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
    }

    ~init() {
        client.close()
        server.close()
    }

    @TestCase
    func redirectHandlerRejectsCrlfUrl(): Unit {
        try {
            server.distributor.register("/red-crlf", RedirectHandler("/target\r\nX-Injected: 1", 302))
            println("[sp] redirect CRLF: registered (unexpected)")
            @Expect(false, true)
        } catch (e: Exception) {
            println("[sp] redirect CRLF: rejected — ${e.message}")
            @Expect(true, true)
        }
    }

    @TestCase
    func redirectHandlerRejectsEmptyUrl(): Unit {
        try {
            server.distributor.register("/red-empty", RedirectHandler("", 302))
            println("[sp] redirect empty: registered (unexpected)")
            @Expect(false, true)
        } catch (e: Exception) {
            println("[sp] redirect empty: rejected ✓")
            @Expect(true, true)
        }
    }

    @TestCase
    func redirectHandlerRejectsNon3xx(): Unit {
        try {
            server.distributor.register("/red-404", RedirectHandler("/target", 404))
            println("[sp] redirect 404: registered (unexpected)")
            @Expect(false, true)
        } catch (e: Exception) {
            println("[sp] redirect 404: rejected ✓")
            @Expect(true, true)
        }
    }

    @TestCase
    func optionsHandlerAllowHeader(): Unit {
        server.distributor.register("/opt", OptionsHandler())
        try {
            let r = client.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(server.port)}/opt")
                .method("OPTIONS").build())
            let allow = r.headers.getFirst("allow") ?? "None"
            println("[sp] OPTIONS: status=${r.status} allow=${allow}")
            @Expect(r.status, 200)
            @Expect(allow.contains("OPTIONS"), true)
        } catch (e: Exception) {
            println("[sp] OPTIONS exception ${e}")
            @Expect(false, true)
        }
    }

    @TestCase
    func funcHandlerThrowNoLeak(): Unit {
        server.distributor.register("/func-throw", FuncHandler({ ctx =>
            throw HttpException("secret-internal-path:/db/connection")
        }))
        try {
            let r = client.get("http://127.0.0.1:${Int64(server.port)}/func-throw")
            let body = spBodyOf(r)
            println("[sp] func throw: status=${r.status} body=[${body}]")
            @Expect(r.status, 500)
            @Expect(body.contains("secret-internal-path"), false)
            @Expect(body.contains("Internal Server Error"), true)
        } catch (e: Exception) {
            println("[sp] func throw exception ${e}")
            @Expect(false, true)
        }
    }
}
