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

func rpReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(8192, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func rpBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(rpReadAll(resp.body))
}

func rpStartSrv(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

@Test
class HuntRedirectPositive {
    @TestCase
    func rp01_cookieSentAcrossPorts(): Unit {
        let a = rpStartSrv()
        let b = rpStartSrv()
        let aPort = Int64(a.port)
        let bPort = Int64(b.port)
        a.distributor.register("/go", { ctx =>
            ctx.responseBuilder.status(302)
                .header("Set-Cookie", "c=1; Path=/")
                .header("Location", "http://127.0.0.1:${bPort}/echo")
        })
        let cookieParts = ArrayList<String>()
        b.distributor.register("/echo", { ctx =>
            for ((name, values) in ctx.request.headers) {
                if (name == "cookie" || name == "Cookie") {
                    for (v in values) { cookieParts.add(v) }
                }
            }
            ctx.responseBuilder.body("ok")
        })
        let c = ClientBuilder().readTimeout(4 * Duration.second).build()
        let resp = c.get("http://127.0.0.1:${aPort}/go")
        let respBody = rpBodyOf(resp)
        c.close()
        a.close()
        b.close()
        var cookieRaw = ""
        for (p in cookieParts) { cookieRaw = cookieRaw + p }
        @Expect(resp.status, 200)
        @Expect(respBody, "ok")
        @Expect(cookieRaw.contains("c=1"), true)
    }

    @TestCase
    func rp02_locationQueryReplacesOriginal(): Unit {
        let s = rpStartSrv()
        let port = Int64(s.port)
        s.distributor.register("/a", { ctx =>
            ctx.responseBuilder.status(302).header("Location", "/echo?q=2")
        })
        let urlParts = ArrayList<String>()
        s.distributor.register("/echo", { ctx =>
            urlParts.add(ctx.request.url.toString())
            ctx.responseBuilder.body("ok")
        })
        let c = ClientBuilder().readTimeout(4 * Duration.second).build()
        let resp = c.get("http://127.0.0.1:${port}/a?q=1")
        c.close()
        s.close()
        var seenUrl = ""
        for (p in urlParts) { seenUrl = p }
        @Expect(resp.status, 200)
        @Expect(seenUrl.contains("q=2"), true)
        @Expect(seenUrl.contains("q=1"), false)
    }

    @TestCase
    func rp03_post307CrossOriginPreserved(): Unit {
        let a = rpStartSrv()
        let b = rpStartSrv()
        let aPort = Int64(a.port)
        let bPort = Int64(b.port)
        a.distributor.register("/go307", { ctx =>
            ctx.responseBuilder.status(307)
                .header("Location", "http://127.0.0.1:${bPort}/echo")
        })
        let echoMethod = ArrayList<String>()
        let echoBody = ArrayList<String>()
        b.distributor.register("/echo", { ctx =>
            echoMethod.add("${ctx.request.method}")
            echoBody.add(String.fromUtf8(rpReadAll(ctx.request.body)))
            ctx.responseBuilder.body("ok")
        })
        let c = ClientBuilder().readTimeout(4 * Duration.second).build()
        let req = HttpRequestBuilder().method("POST")
            .url("http://127.0.0.1:${aPort}/go307").body("post-body-307").build()
        let resp = c.send(req)
        c.close()
        a.close()
        b.close()
        var method = ""
        for (p in echoMethod) { method = p }
        var body = ""
        for (p in echoBody) { body = p }
        @Expect(resp.status, 200)
        @Expect(method, "POST")
        @Expect(body, "post-body-307")
    }
}
