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

func rcReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func rcBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(rcReadAll(resp.body))
}

func rcStartSrv(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func rcResponseWith(setCookieValue: String): HttpResponse {
    return HttpResponseBuilder().status(200).header("Set-Cookie", setCookieValue).body("ok").build()
}

@Test
class HuntRedirectCookiePins {
    @TestCase
    func sameOriginRedirectKeepsAuthorization(): Unit {
        let s = rcStartSrv()
        let port = Int64(s.port)
        s.distributor.register("/a", { ctx =>
            ctx.responseBuilder.status(302).header("Location", "/echo")
        })
        s.distributor.register("/echo", { ctx =>
            let auth = ctx.request.headers.getFirst("authorization") ?? "-"
            ctx.responseBuilder.body("auth=[${auth}]")
        })
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${port}/a")
            .header("Authorization", "Bearer same-origin-token").build()
        let resp = c.send(req)
        let body = rcBodyOf(resp)
        @Expect(resp.status, 200)
        @Expect(body, "auth=[Bearer same-origin-token]")
        c.close()
        s.close()
    }

    @TestCase
    func userinfoLocationDoesNotInjectAuthorization(): Unit {
        let s = rcStartSrv()
        let port = Int64(s.port)
        s.distributor.register("/a", { ctx =>
            ctx.responseBuilder.status(302).header("Location", "http://user:pass@127.0.0.1:${port}/echo")
        })
        s.distributor.register("/echo", { ctx =>
            let auth = ctx.request.headers.getFirst("authorization") ?? "-"
            ctx.responseBuilder.body("auth=[${auth}]")
        })
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let resp = c.get("http://127.0.0.1:${port}/a")
        let body = rcBodyOf(resp)
        @Expect(resp.status, 200)
        @Expect(body.contains("dXNlcjpwYXNz"), false)
        c.close()
        s.close()
    }

    @TestCase
    func ipHostCookieWithDomainRejected(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let parsed = CookieJar.parseSetCookieHeader(rcResponseWith("a=1; Domain=127.0.0.1; Path=/"))
        jar.storeCookies(URL.parse("http://127.0.0.1/"), parsed)
        @Expect(jar.getCookies(URL.parse("http://127.0.0.1/")).size, 0)
    }
}
