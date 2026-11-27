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
import stdx.crypto.kit.*
import stdx.encoding.url.*
import std.net.*
import std.io.*
import std.convert.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func wcReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func wcBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(wcReadAll(resp.body))
}

func wcStartWsServer(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/ws", { ctx =>
        let ws = WebSocket.upgradeFromServer(ctx)
        while (true) {
            let frame = ws.read()
            if (frame.frameType == CloseWebFrame) {
                ws.writeCloseFrame(status: Some(1000u16), reason: "bye")
                break
            }
            ws.write(frame.frameType, frame.payload)
        }
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func wcUpgrade(client: Client, port: Int64, path: String): WebSocket {
    let (ws, _) = WebSocket.upgradeFromClient(client,
        URL.parse("ws://127.0.0.1:${port}${path}"))
    return ws
}

func wcStartEchoServer(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/echo-headers", { ctx =>
        let sb = StringBuilder()
        for ((name, values) in ctx.request.headers) {
            for (v in values) { sb.append("${name}:${v}\n") }
        }
        ctx.responseBuilder.body(sb.toString())
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

@Test
class WsConcurrentHunt {
    @TestCase
    func wsFrameSizeZeroRejected(): Unit {
        let server = wcStartWsServer()
        let client = ClientBuilder().readTimeout(5 * Duration.second).build()
        let (ws, _) = WebSocket.upgradeFromClient(client,
            URL.parse("ws://127.0.0.1:${Int64(server.port)}/ws"))
        try {
            ws.write(TextWebFrame, "hello".toArray().map({ b => UInt8(b) }), frameSize: 0)
            println("[wc] frameSize=0 ACCEPTED (unexpected)")
            @Expect(false, true)
        } catch (e: WebSocketException) {
            println("[wc] frameSize=0 -> ${e.message}")
            @Expect(e.message.contains("positive"), true)
        } catch (e: Exception) {
            println("[wc] frameSize=0 -> ${e}")
            @Expect(false, true)
        }
        ws.closeConn()
        client.close(); server.close()
    }

    @TestCase
    func wsFrameSizeNegativeRejected(): Unit {
        let server = wcStartWsServer()
        let client = ClientBuilder().readTimeout(5 * Duration.second).build()
        let (ws, _) = WebSocket.upgradeFromClient(client,
            URL.parse("ws://127.0.0.1:${Int64(server.port)}/ws"))
        try {
            ws.write(TextWebFrame, "hello".toArray().map({ b => UInt8(b) }), frameSize: -1)
            println("[wc] frameSize=-1 ACCEPTED (unexpected)")
            @Expect(false, true)
        } catch (e: WebSocketException) {
            println("[wc] frameSize=-1 -> ${e.message}")
            @Expect(e.message.contains("positive"), true)
        } catch (e: Exception) {
            println("[wc] frameSize=-1 -> ${e}")
            @Expect(false, true)
        }
        ws.closeConn()
        client.close(); server.close()
    }

    @TestCase
    func cookieJarConcurrentAccess(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let url = URL.parse("http://example.com/")
        let errors = AtomicInt64(0)
        for (i in 0..10) {
            let tag = "cookie-${i}"
            spawn {
                try {
                    let cookie = Cookie(tag, "value-${i}")
                    jar.storeCookies(url, ArrayList<Cookie>([cookie]))
                    let got = jar.getCookies(url)
                    if (got.size == 0) { errors.fetchAdd(1) }
                } catch (e: Exception) {
                    println("[wc] cookie exception ${e}")
                    errors.fetchAdd(1)
                }
                ()
            }
        }
        sleep(Duration.second * 2)
        println("[wc] cookie concurrent errors=${errors.load()}")
        @Expect(errors.load(), 0)
    }

    @TestCase
    func httpHeadersConcurrentAccess(): Unit {
        let headers = HttpHeaders()
        let errors = AtomicInt64(0)
        for (i in 0..10) {
            let tag = "hdr-${i}"
            spawn {
                try {
                    headers.add(tag, "value")
                    let got = headers.getFirst(tag)
                    match (got) {
                        case Some(v) => if (v != "value") { errors.fetchAdd(1) }
                        case None => errors.fetchAdd(1)
                    }
                } catch (e: Exception) {
                    println("[wc] headers exception ${e}")
                    errors.fetchAdd(1)
                }
                ()
            }
        }
        sleep(Duration.second * 2)
        println("[wc] headers concurrent errors=${errors.load()}")
        @Expect(errors.load(), 0)
    }

    @TestCase
    func contentEncodingGzipPassthrough(): Unit {
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        spawn {
            while (true) {
                try {
                    let sock = listener.accept()
                    spawn {
                        try {
                            let buf = Array<UInt8>(8192, repeat: 0)
                            var gotHead = false
                            while (true) {
                                let n = sock.read(buf)
                                if (n <= 0) { break }
                                if (String.fromUtf8(buf[0..n]).contains("\r\n\r\n")) { gotHead = true; break }
                            }
                            if (gotHead) {
                                let header = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Encoding: gzip\r\nContent-Length: 25\r\n\r\n"
                                sock.write(header.toArray().map({ b => UInt8(b) }))
                                let gzipBody: Array<UInt8> = [0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xcb, 0x48, 0xcd, 0xc9, 0xc9, 0x07, 0x00, 0x86, 0xa6, 0xbc, 0x4c, 0x05, 0x00, 0x00, 0x00]
                                sock.write(gzipBody)
                                sleep(Duration.millisecond * 500)
                            }
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
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            let raw = wcReadAll(r.body)
            let ce = r.headers.getFirst("content-encoding") ?? "None"
            var isGzip = raw.size >= 2 && raw[0] == 0x1f && raw[1] == 0x8b
            var hasHello = false
            try {
                let bodyStr = String.fromUtf8(raw)
                if (bodyStr.contains("hello world")) { hasHello = true }
            } catch (e: Exception) { () }
            println("[wc] gzip: ce=${ce} rawLen=${raw.size} isGzip=${isGzip} hasHello=${hasHello}")
            @Expect(r.status, 200)
            @Expect(ce, "gzip")
            @Expect(isGzip, true)
            @Expect(hasHello, false)
        } catch (e: Exception) {
            println("[wc] gzip exception ${e}")
            @Expect(false, true)
        }
        c.close(); listener.close()
    }

    @TestCase
    func contentEncodingMalformedGzipPassthrough(): Unit {
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        spawn {
            while (true) {
                try {
                    let sock = listener.accept()
                    spawn {
                        try {
                            let buf = Array<UInt8>(8192, repeat: 0)
                            var gotHead = false
                            while (true) {
                                let n = sock.read(buf)
                                if (n <= 0) { break }
                                if (String.fromUtf8(buf[0..n]).contains("\r\n\r\n")) { gotHead = true; break }
                            }
                            if (gotHead) {
                                sock.write("HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Encoding: gzip\r\nContent-Length: 5\r\n\r\nHELLO".toArray().map({ b => UInt8(b) }))
                                sleep(Duration.millisecond * 300)
                            }
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
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            let body = wcBodyOf(r)
            println("[wc] malformed gzip: status=${r.status} body=[${body}]")
            @Expect(r.status, 200)
            @Expect(body, "HELLO")
        } catch (e: Exception) {
            println("[wc] malformed gzip exception ${e}")
            @Expect(false, true)
        }
        c.close(); listener.close()
    }

    @TestCase
    func sameSiteStrictCookieSent(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let echoSrv = wcStartEchoServer()
        let c = ClientBuilder().cookieJar(jar).readTimeout(5 * Duration.second).build()
        let resp = HttpResponseBuilder().status(200)
            .header("set-cookie", "strictcookie=1; SameSite=Strict; Path=/").body("ok").build()
        jar.storeCookies(URL.parse("http://127.0.0.1:${Int64(echoSrv.port)}/"), CookieJar.parseSetCookieHeader(resp))
        let r = c.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(echoSrv.port)}/echo-headers").build())
        let body = wcBodyOf(r)
        println("[wc] SameSite=Strict: ${body}")
        @Expect(body.contains("strictcookie"), true)
        c.close(); echoSrv.close()
    }

    @TestCase
    func sameSitePreservedInOthers(): Unit {
        let resp = HttpResponseBuilder().status(200)
            .header("set-cookie", "sscookie=1; SameSite=Lax; Path=/").body("ok").build()
        let cookies = CookieJar.parseSetCookieHeader(resp)
        @Expect(cookies.size, 1)
        @Expect(cookies[0].others.size > 0, true)
        @Expect(cookies[0].others[0].contains("SameSite"), true)
    }

    @TestCase
    func chunkedWithContentEncodingGzip(): Unit {
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
                            let resp = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Encoding: gzip\r\nTransfer-Encoding: chunked\r\n\r\n" +
                                "6\r\nhello \r\n" + "5\r\nworld\r\n" + "0\r\n\r\n"
                            sock.write(resp.toArray().map({ b => UInt8(b) }))
                            sleep(Duration.millisecond * 500)
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
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            let raw = wcReadAll(r.body)
            let body = String.fromUtf8(raw)
            let ce = r.headers.getFirst("content-encoding") ?? "None"
            let te = r.headers.getFirst("transfer-encoding") ?? "None"
            println("[wc] chunked+gzip: ce=${ce} te=${te} rawLen=${raw.size} body=[${body}]")
            @Expect(r.status, 200)
            @Expect(ce, "gzip")
            @Expect(body, "hello world")
        } catch (e: Exception) {
            println("[wc] chunked+gzip exception ${e}")
            @Expect(false, true)
        }
        c.close(); listener.close()
    }

    @TestCase
    func chunkedWithContentEncodingAndTrailer(): Unit {
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
                            let resp = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Encoding: gzip\r\nTransfer-Encoding: chunked\r\nTrailer: X-Summary\r\n\r\n" +
                                "4\r\ndata\r\n" + "0\r\n" + "X-Summary: total=4\r\n" + "\r\n"
                            sock.write(resp.toArray().map({ b => UInt8(b) }))
                            sleep(Duration.millisecond * 500)
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
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            let raw = wcReadAll(r.body)
            let body = String.fromUtf8(raw)
            let ce = r.headers.getFirst("content-encoding") ?? "None"
            println("[wc] chunked+gzip+trailer: ce=${ce} rawLen=${raw.size} body=[${body}]")
            @Expect(r.status, 200)
            @Expect(ce, "gzip")
            @Expect(body, "data")
        } catch (e: Exception) {
            println("[wc] chunked+gzip+trailer exception ${e}")
            @Expect(false, true)
        }
        c.close(); listener.close()
    }

    @TestCase
    func chunkedNoContentEncoding(): Unit {
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
                            let resp = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nTransfer-Encoding: chunked\r\n\r\n" +
                                "6\r\nhello \r\n" + "8\r\nchunked \r\n" + "5\r\nworld\r\n" + "0\r\n\r\n"
                            sock.write(resp.toArray().map({ b => UInt8(b) }))
                            sleep(Duration.millisecond * 500)
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
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            let body = String.fromUtf8(wcReadAll(r.body))
            let te = r.headers.getFirst("transfer-encoding") ?? "None"
            println("[wc] chunked-control: te=${te} body=[${body}]")
            @Expect(r.status, 200)
            @Expect(te, "None")
            @Expect(body, "hello chunked world")
        } catch (e: Exception) {
            println("[wc] chunked-control exception ${e}")
            @Expect(false, true)
        }
        c.close(); listener.close()
    }

    @TestCase
    func requestBodyContentEncodingPassthrough(): Unit {
        let s = wcStartEchoServer()
        s.distributor.register("/echo-ce", { ctx =>
            let ce = ctx.request.headers.getFirst("content-encoding") ?? "None"
            let body = String.fromUtf8(wcReadAll(ctx.request.body))
            ctx.responseBuilder.body("server-saw-ce=${ce} body=[${body}]")
        })
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/echo-ce")
                .header("content-encoding", "gzip")
                .body("plain-text-not-gzip").post().build())
            let respBody = wcBodyOf(r)
            println("[wc] req CE:gzip: status=${r.status} resp=[${respBody}]")
            @Expect(r.status, 200)
            @Expect(respBody.contains("server-saw-ce=gzip"), true)
            @Expect(respBody.contains("plain-text-not-gzip"), true)
        } catch (e: Exception) {
            println("[wc] req CE exception ${e}")
            @Expect(false, true)
        }
        c.close(); s.close()
    }

    @TestCase
    func trailerExposedAfterFullRead(): Unit {
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
                            let resp = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nTransfer-Encoding: chunked\r\nTrailer: X-Summary\r\n\r\n" +
                                "4\r\ndata\r\n" + "0\r\n" + "X-Summary: total=4\r\n" + "\r\n"
                            sock.write(resp.toArray().map({ b => UInt8(b) }))
                            sleep(Duration.millisecond * 500)
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
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            let body = String.fromUtf8(wcReadAll(r.body))
            println("[wc] trailer body=[${body}]")
            @Expect(body, "data")

            let trailers = r.trailers
            var found = false
            for ((name, values) in trailers) {
                for (v in values) {
                    if (name == "x-summary" || name == "X-Summary") {
                        found = true
                        println("[wc] trailer found: ${name}=${v}")
                    }
                }
            }
            println("[wc] trailer X-Summary found=${found}")
            @Expect(found, true)
        } catch (e: Exception) {
            println("[wc] trailer exception ${e}")
            @Expect(false, true)
        }
        c.close(); listener.close()
    }
}
