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
import stdx.encoding.url.*
import std.net.*
import std.io.*
import std.convert.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func lbReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(65536, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func lbBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(lbReadAll(resp.body))
}

func lbMakePattern(size: Int64): Array<UInt8> {
    let out = ArrayList<UInt8>()
    for (i in 0..size) { out.add(UInt8(i % 251)) }
    return out.toArray()
}

var lbEchoPort = 0

func lbStartEcho(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/echo", { ctx =>
        let body = lbReadAll(ctx.request.body)
        let seq = ctx.request.headers.getFirst("x-seq") ?? "none"
        ctx.responseBuilder.body("resp-${seq} bodyLen=${body.size}")
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    lbEchoPort = Int64(s.port)
    return s
}

@Test
class PoolAndStreamHunt {
    var server: Server

    init() {
        server = lbStartEcho()
    }

    ~init() {
        server.close()
    }

    @TestCase
    func poolSize10AtLimit(): Unit {
        let c = ClientBuilder().poolSize(10).readTimeout(15 * Duration.second).build()
        let okCount = AtomicInt64(0)
        let errCount = AtomicInt64(0)
        for (i in 0..10) {
            let seq = "at-limit-${i}"
            spawn {
                try {
                    let r = c.send(HttpRequestBuilder().url("http://127.0.0.1:${lbEchoPort}/echo")
                        .header("x-seq", seq).body("body-${seq}").post().build())
                    let body = lbBodyOf(r)
                    if (r.status == 200 && body.contains("resp-${seq}")) { okCount.fetchAdd(1) }
                    else { errCount.fetchAdd(1); println("[lb] ${seq} unexpected: ${body}") }
                } catch (e: Exception) {
                    println("[lb] ${seq} exception ${e}")
                    errCount.fetchAdd(1)
                }
                ()
            }
        }
        sleep(Duration.second * 8)
        println("[lb] at-limit(10): ok=${okCount.load()} err=${errCount.load()}")
        @Expect(okCount.load(), 10)
        @Expect(errCount.load(), 0)
        c.close()
    }

    @TestCase
    func inputStreamThrowsMidReadFullBuffering(): Unit {
        let c = ClientBuilder().readTimeout(10 * Duration.second).build()
        let failingStream = FailingInputStream(1024, 512)
        try {
            let r = c.send(HttpRequestBuilder().url("http://127.0.0.1:${lbEchoPort}/echo")
                .header("content-length", "1024")
                .body(failingStream).post().build())
            let body = lbBodyOf(r)
            println("[lb] failing stream: status=${r.status} body=[${body}]")
            @Expect(r.status, 200)
            @Expect(body.contains("bodyLen=1024"), true)
        } catch (e: Exception) {
            println("[lb] failing stream: exception ${e}")
        }
        c.close()
    }

    @TestCase
    func slowInputStreamWriteTimeout(): Unit {
        let c = ClientBuilder().readTimeout(3 * Duration.second).build()
        let slowStream = SlowInputStream(100, 100)
        try {
            let r = c.send(HttpRequestBuilder().url("http://127.0.0.1:${lbEchoPort}/echo")
                .header("content-length", "100")
                .body(slowStream).post().build())
            println("[lb] slow stream: status=${r.status}")
        } catch (e: Exception) {
            println("[lb] slow stream: exception ${e}")
        }
        c.close()
    }
}

class FailingInputStream <: InputStream {
    let total: Int64
    let failAt: Int64
    var pos: Int64 = 0
    init(total: Int64, failAt: Int64) {
        this.total = total
        this.failAt = failAt
    }
    public func read(buf: Array<UInt8>): Int64 {
        if (pos >= total) { return 0 }
        if (pos >= failAt) { throw IOException("stream failed at ${pos}") }
        var n = buf.size
        if (n > total - pos) { n = total - pos }
        for (i in 0..n) { buf[i] = 0x41 }
        pos += n
        return n
    }
}

class SlowInputStream <: InputStream {
    let total: Int64
    let delayMs: Int64
    var pos: Int64 = 0
    init(total: Int64, delayMs: Int64) {
        this.total = total
        this.delayMs = delayMs
    }
    public func read(buf: Array<UInt8>): Int64 {
        if (pos >= total) { return 0 }
        sleep(Duration.millisecond * delayMs)
        buf[0] = 0x42
        pos += 1
        return 1
    }
}

@Test
class CookieLimitHunt {
    @TestCase
    func cookieCount100PerDomain(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let url = URL.parse("http://example.com/")
        let cookies = ArrayList<Cookie>()
        for (i in 0..100) {
            let resp = HttpResponseBuilder().status(200)
                .header("set-cookie", "cookie${i}=value${i}; Path=/").body("ok").build()
            let parsed = CookieJar.parseSetCookieHeader(resp)
            for (c in parsed) { cookies.add(c) }
        }
        jar.storeCookies(url, cookies)
        let got = jar.getCookies(url)
        println("[cl] 100 cookies stored, got=${got.size}")
        @Expect(got.size, 100)
    }

    @TestCase
    func cookieRoundTrip100(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let url = URL.parse("http://example.com/")
        let cookies = ArrayList<Cookie>()
        for (i in 0..100) {
            let resp = HttpResponseBuilder().status(200)
                .header("set-cookie", "rt${i}=rtval${i}; Path=/").body("ok").build()
            let parsed = CookieJar.parseSetCookieHeader(resp)
            for (c in parsed) { cookies.add(c) }
        }
        jar.storeCookies(url, cookies)
        let cookieStr = CookieJar.toCookieString(cookies)
        println("[cl] cookie string length=${cookieStr.size}")
        @Expect(cookieStr.contains("rt0=rtval0"), true)
        @Expect(cookieStr.contains("rt99=rtval99"), true)
    }
}
