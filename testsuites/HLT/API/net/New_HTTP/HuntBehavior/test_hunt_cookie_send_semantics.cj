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
import std.io.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func csReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(8192, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func csStartSrv(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func csIndexOf(s: String, needle: String): Int64 {
    match (s.indexOf(needle)) {
        case Some(i) => i
        case None => -1
    }
}

@Test
class HuntCookieSendSemantics {
    @TestCase
    func cs01_sendOrderingPathLengthThenCreation(): Unit {
        let s = csStartSrv()
        let port = Int64(s.port)
        s.distributor.register("/setorder", { ctx =>
            ctx.responseBuilder
                .header("Set-Cookie", "p=1; Path=/a/b")
                .header("Set-Cookie", "q=2; Path=/")
                .header("Set-Cookie", "r=3; Path=/a/b")
                .body("set")
        })
        let rawParts = ArrayList<String>()
        s.distributor.register("/a/b", { ctx =>
            for ((name, values) in ctx.request.headers) {
                if (name == "cookie" || name == "Cookie") {
                    for (v in values) { rawParts.add(v) }
                }
            }
            ctx.responseBuilder.body("ok")
        })
        let c = ClientBuilder().readTimeout(4 * Duration.second).build()
        let r1 = c.get("http://127.0.0.1:${port}/setorder")
        let r2 = c.get("http://127.0.0.1:${port}/a/b")
        c.close()
        s.close()
        var raw = ""
        for (p in rawParts) { raw = raw + p }
        let idxP = csIndexOf(raw, "p=1")
        let idxR = csIndexOf(raw, "r=3")
        let idxQ = csIndexOf(raw, "q=2")
        println("[CS01] cookie=[${raw}]")
        @Expect(r1.status, 200)
        @Expect(r2.status, 200)
        @Expect(idxP >= 0 && idxR >= 0 && idxQ >= 0, true)
        @Expect(idxP < idxR && idxR < idxQ, true)
    }

    @TestCase
    func cs02_singleFoldedCookieHeader(): Unit {
        let s = csStartSrv()
        let port = Int64(s.port)
        s.distributor.register("/set", { ctx =>
            ctx.responseBuilder
                .header("Set-Cookie", "a=1; Path=/")
                .header("Set-Cookie", "b=2; Path=/")
                .body("set")
        })
        let echoParts = ArrayList<String>()
        s.distributor.register("/echo", { ctx =>
            for ((name, values) in ctx.request.headers) {
                if (name == "cookie" || name == "Cookie") {
                    for (v in values) { echoParts.add(v) }
                }
            }
            ctx.responseBuilder.body("ok")
        })
        let c = ClientBuilder().readTimeout(4 * Duration.second).build()
        let r1 = c.get("http://127.0.0.1:${port}/set")
        let r2 = c.get("http://127.0.0.1:${port}/echo")
        c.close()
        s.close()
        var raw = ""
        for (p in echoParts) { raw = raw + p }
        let cnt = Int64(echoParts.size)
        println("[CS02] count=${cnt} cookie=[${raw}]")
        @Expect(r1.status, 200)
        @Expect(r2.status, 200)
        @Expect(cnt, 1)
        @Expect(csIndexOf(raw, "a=1") >= 0 && csIndexOf(raw, "b=2") >= 0, true)
    }
}
