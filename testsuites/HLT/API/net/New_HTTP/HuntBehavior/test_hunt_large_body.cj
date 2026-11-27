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

func lbVerify(body: Array<UInt8>, size: Int64): Bool {
    if (Int64(body.size) != size) { return false }
    for (i in 0..size) { if (body[i] != UInt8(i % 251)) { return false } }
    return true
}

var lbReceivedSize = AtomicInt64(0)

func lbStartEchoServer(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/echo", { ctx =>
        let body = lbReadAll(ctx.request.body)
        lbReceivedSize.store(Int64(body.size))
        ctx.responseBuilder.body(body)
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func lbStartLimitedServer(limit: Int64): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).maxRequestBodySize(limit).build()
    s.distributor.register("/echo", { ctx =>
        let body = lbReadAll(ctx.request.body)
        ctx.responseBuilder.body(body)
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func lbStartPartialServer(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/echo", { ctx =>
        let buf = Array<UInt8>(1024, repeat: 0)
        let n = ctx.request.body.read(buf)
        ctx.responseBuilder.body("partial-${n}")
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

@Test
class LargeBodyHunt {
    @TestCase
    func oneMbBodyEcho(): Unit {
        let s = lbStartEchoServer()
        let c = ClientBuilder().readTimeout(30 * Duration.second).build()
        let body = lbMakePattern(1024 * 1024)
        let r = c.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/echo")
            .body(body).post().build())
        let respBody = lbReadAll(r.body)
        println("[lb] 1MB echo: status=${r.status} respLen=${respBody.size} integrity=${lbVerify(respBody, 1024 * 1024)}")
        @Expect(r.status, 200)
        @Expect(lbVerify(respBody, 1024 * 1024), true)
        c.close(); s.close()
    }

    @TestCase
    func maxRequestBodySizeEnforced(): Unit {
        let s = lbStartLimitedServer(1024)
        let c = ClientBuilder().readTimeout(10 * Duration.second).build()

        let smallBody = lbMakePattern(512)
        let r1 = c.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/echo")
            .body(smallBody).post().build())
        println("[lb] max=1024 small(512B): status=${r1.status}")
        @Expect(r1.status, 200)

        let largeBody = lbMakePattern(1024 * 1024)
        var got413 = false
        try {
            let r2 = c.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/echo")
                .body(largeBody).post().build())
            println("[lb] max=1024 large(1MB): status=${r2.status}")
            if (r2.status == 413) { got413 = true }
        } catch (e: Exception) {
            println("[lb] max=1024 large: exception ${e}")
        }
        @Expect(got413, true)
        c.close(); s.close()
    }

    @TestCase
    func partialBodyReadThenRespond(): Unit {
        let s = lbStartPartialServer()
        let c = ClientBuilder().readTimeout(10 * Duration.second).build()
        let body = lbMakePattern(1024 * 1024)
        let r = c.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/echo")
            .body(body).post().build())
        let respBody = lbBodyOf(r)
        println("[lb] partial-read: status=${r.status} resp=[${respBody}]")
        @Expect(r.status, 200)
        @Expect(respBody.startsWith("partial-1024"), true)
        c.close(); s.close()
    }

    @TestCase
    func defaultMaxRequestBodySize(): Unit {
        let s = lbStartEchoServer()
        let c = ClientBuilder().readTimeout(30 * Duration.second).build()

        let body1m = lbMakePattern(1024 * 1024)
        let r1 = c.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/echo")
            .body(body1m).post().build())
        println("[lb] default-limit 1MB: status=${r1.status}")
        @Expect(r1.status, 200)
        @Expect(lbVerify(lbReadAll(r1.body), 1024 * 1024), true)

        var got413 = false
        try {
            let body10m = lbMakePattern(10 * 1024 * 1024)
            let r2 = c.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/echo")
                .body(body10m).post().build())
            println("[lb] default-limit 10MB: status=${r2.status}")
            if (r2.status == 413) { got413 = true }
        } catch (e: Exception) {
            println("[lb] default-limit 10MB: exception ${e}")
        }
        @Expect(got413, true)
        c.close(); s.close()
    }
}
