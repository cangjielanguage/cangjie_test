/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import std.net.*
import std.collection.*
import stdx.net.http.*
import stdx.net.tls.common.*
import stdx.net.tls
import stdx.crypto.kit
import stdx.encoding.url.*
import std.math.*

@Test
public class Test_poolSize {
    @TestCase
    func default(): Unit {
        let client = ClientBuilder().build()
        @Expect(client.poolSize, 10)
    }

    @TestCase
    func set(): Unit {
        let client = ClientBuilder().poolSize(1024).build()
        @Expect(client.poolSize, 1024)
    }

    @TestCase
    func overwrite(): Unit {
        let client = ClientBuilder().poolSize(1024).poolSize(Int64.Max).build()
        @Expect(client.poolSize, 9223372036854775807)
    }

    @TestCase
    func over_poolsize(): Unit {
        let server1 = ServerBuilder().addr("127.0.0.1").port(0).build()
        server1.distributor.register("/dd", {ctx => ctx.responseBuilder.body("a")})
        spawn {
            server1.serve()
        }
        while (server1.port == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().poolSize(2).build()

        // requests beyond poolSize queue for a free connection instead of
        // being rejected with "Too many connections"; all of them succeed
        // once the bodies are consumed. Each coroutine builds its own
        // request to avoid sharing a mutable HttpRequest concurrently.
        let okCount = AtomicInt64(0)
        let n = 3
        for (_ in 0..n) {
            spawn {
                let r = HttpRequestBuilder().url("http://127.0.0.1:${server1.port}/dd").build()
                let resp = client.send(r)
                let buf = Array<UInt8>(1024, repeat: 0)
                while (resp.body.read(buf) > 0) {}
                okCount.fetchAdd(1)
                ()
            }
        }
        var waited = 0
        while (okCount.load() < n && waited < 100) {
            sleep(Duration.millisecond * 100)
            waited++
        }
        @Expect(okCount.load(), n)
    }

    @TestCase
    func zero(): Unit {
        var flag = false
        try {
            let client = ClientBuilder().poolSize(0).build()
        } catch (e: Exception) {
            flag = true
            @Expect(e.message, "Invalid argument 'size': expected a positive value, got 0.")
        }
        @Expect(flag, true)
    }

    @TestCase
    func negative(): Unit {
        var flag = false
        try {
            let client = ClientBuilder().poolSize(-1).build()
        } catch (e: Exception) {
            flag = true
            @Expect(e.message, "Invalid argument 'size': expected a positive value, got -1.")
        }
        @Expect(flag, true)
    }
}
