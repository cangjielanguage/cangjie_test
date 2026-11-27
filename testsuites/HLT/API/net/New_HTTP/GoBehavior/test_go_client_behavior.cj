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
import stdx.encoding.url.*
import stdx.encoding.base64.*
import stdx.crypto.kit.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.common.*
import stdx.crypto.x509.*
import std.net.*
import std.io.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func newClient(): Client {
    return ClientBuilder().readTimeout(5 * Duration.second).build()
}

@Test
class GoClientBehaviorTest {
    @TestCase
    func redirectChainWithinLimit(): Unit {
        let server = startServer({
            s =>
            s.distributor.register("/h1", { ctx => ctx.responseBuilder.status(302).header("Location", "/h2") })
            s.distributor.register("/h2", { ctx => ctx.responseBuilder.status(302).header("Location", "/h3") })
            s.distributor.register("/h3", { ctx => ctx.responseBuilder.status(302).header("Location", "/h4") })
            s.distributor.register("/h4", { ctx => ctx.responseBuilder.status(302).header("Location", "/h5") })
            s.distributor.register("/h5", { ctx => ctx.responseBuilder.status(302).header("Location", "/h6") })
            s.distributor.register("/h6", { ctx => ctx.responseBuilder.status(302).header("Location", "/h7") })
            s.distributor.register("/h7", { ctx => ctx.responseBuilder.status(302).header("Location", "/h8") })
            s.distributor.register("/h8", { ctx => ctx.responseBuilder.status(302).header("Location", "/h9") })
            s.distributor.register("/h9", { ctx => ctx.responseBuilder.status(302).header("Location", "/done") })
            s.distributor.register("/done", { ctx => ctx.responseBuilder.body("done") })
        })
        let c = newClient()
        let resp = c.get("http://127.0.0.1:${server.port}/h1")
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "done")
        c.close()
        server.close()
    }
    @TestCase
    func refererSetOnRedirect(): Unit {
        let server = startServer({
            s =>
            s.distributor.register("/a", {
                ctx => ctx.responseBuilder.status(302).header("Location", "/b")
            })
            s.distributor.register("/b", {
                ctx => ctx.responseBuilder.body(ctx.request.headers.getFirst("Referer") ?? "no-referer")
            })
        })
        let c = newClient()
        let resp = c.get("http://127.0.0.1:${server.port}/a")
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "http://127.0.0.1:${server.port}/a")
        c.close()
        server.close()
    }
    @TestCase
    func authorizationStrippedOnCrossHostRedirect(): Unit {
        let s2 = startServer({
            s => s.distributor.register("/auth", {
                ctx => ctx.responseBuilder.body(ctx.request.headers.getFirst("Authorization") ?? "stripped")
            })
        })
        let s1 = startServer({
            s => s.distributor.register("/a", {
                ctx => ctx.responseBuilder.status(302).header("Location", "http://127.0.0.1:${s2.port}/auth")
            })
        })
        let c = newClient()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${s1.port}/a")
            .header("Authorization", "Basic YWJjOmRlZg==").build()
        let resp = c.send(req)
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "stripped")
        c.close()
        s1.close()
        s2.close()
    }
    @TestCase
    func cookieIsolationAcrossLoopbackHosts(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        jar.storeCookies(URL.parse("http://127.0.0.1:8801/"), ArrayList<Cookie>([Cookie("a", "1")]))
        @Expect(jar.getCookies(URL.parse("http://127.0.0.1:8801/")).size, 1)
        @Expect(jar.getCookies(URL.parse("http://127.0.0.2:8802/")).size, 0)
    }
    @TestCase
    func basicAuthHeaderEncoded(): Unit {
        let server = startServer({
            s => s.distributor.register("/", {
                ctx => ctx.responseBuilder.body(ctx.request.headers.getFirst("Authorization") ?? "none")
            })
        })
        let c = newClient()
        let cred = toBase64String("user:pass".toArray())
        let req = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/")
            .header("Authorization", "Basic ${cred}").build()
        let resp = c.send(req)
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "Basic ${cred}")
        c.close()
        server.close()
    }
    @TestCase
    func emptyPasswordBasicAuth(): Unit {
        let cred = toBase64String("user:".toArray())
        @Expect(cred, "dXNlcjo=")
    }
    @TestCase
    func httpsClientDetectsHttpServer(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("plain") })
        })
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = CertificateVerifyMode.TrustAll
        let client = ClientBuilder().tlsConfig(ccfg).readTimeout(5 * Duration.second).build()
        try {
            let resp = client.get("https://127.0.0.1:${server.port}/")
            @Fail("expected protocol mismatch failure, got ${resp.status}")
        } catch (e: Exception) {
            @Expect(e.message.size > 0)
        } catch (e: Error) {
            @Expect(e.message.size > 0)
        }
        client.close()
        server.close()
    }
    @TestCase
    func clientCloseThenRequestFails(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        })
        let c = newClient()
        c.close()
        try {
            let resp = c.get("http://127.0.0.1:${server.port}/")
            @Fail("expected failure after client.close(), got ${resp.status}")
        } catch (e: Exception) {
            @Expect(e.message.size > 0)
        }
        server.close()
    }
}
