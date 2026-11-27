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
import stdx.crypto.kit.*
import std.net.*
import std.io.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func dnClient(): Client {
    return ClientBuilder().readTimeout(10 * Duration.second).build()
}

@Test
class DotnetResponseSemanticsTest {
    @TestCase
    func largeResponseHeadersAccepted(): Unit {
        let server = startServer({
            s => s.distributor.register("/", {
                ctx =>
                for (i in 0..99) {
                    let pad = String.fromUtf8(Array<UInt8>(8000, repeat: 0x78))
                    ctx.responseBuilder.header("X-Pad-${i}", pad)
                }
                ctx.responseBuilder.body("bigheaders-ok")
            })
        })
        let c = dnClient()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "bigheaders-ok")
        c.close()
        server.close()
    }
    @TestCase
    func zeroLengthBufferRead(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("abc") })
        })
        let c = dnClient()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        let empty = Array<UInt8>(0, repeat: 0)
        @Expect(resp.body.read(empty), 0)
        let one = Array<UInt8>(4, repeat: 0)
        let n = resp.body.read(one)
        @Expect(n, 3)
        @Expect(one[0], 0x61)
        c.close()
        server.close()
    }
    @TestCase
    func headerCaseInsensitiveMatch(): Unit {
        let server = startServer({
            s => s.distributor.register("/", {
                ctx => ctx.responseBuilder.header("X-CuStOm-HeAdEr", "v1").body("ok")
            })
        })
        let c = dnClient()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp.headers.getFirst("x-custom-header") ?? "missing", "v1")
        c.close()
        server.close()
    }
    @TestCase
    func headerValueWhitespaceTrimmed(): Unit {
        let server = startServer({
            s => s.distributor.register("/", {
                ctx => ctx.responseBuilder.header("X-Space", "   v1   ").body("ok")
            })
        })
        let c = dnClient()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp.headers.getFirst("X-Space") ?? "missing", "v1")
        c.close()
        server.close()
    }
}
