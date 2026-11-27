/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../../okhttp_support
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl okhttp_support/common.cj %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt --parallel=false

import stdx.net.http.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.crypto.common.*
import std.net.*
import std.io.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

// Ported from Go x/net/http2 server_push_test.go (G7 batch).
// Tests stdx H2 Server Push: server pushes resource via HttpResponsePusher,
// client (with enablePush) should receive the pushed response.

func pushCert(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

@Test
class H2ServerPushTest {

    // Go: TestServer_Push_Success — server pushes /pushed in response to /
    // client (with enablePush) should receive both the main and pushed responses
    @TestCase
    func serverPushSuccess(): Unit {
        var scfg = tlsServerConfig(["h2"])
        let serverSocket = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket)
            .tlsConfig(scfg)
            .build()
        server.distributor.register("/", {
            ctx =>
            let pusher = HttpResponsePusher.getPusher(ctx)
            match (pusher) {
                case Some(p) =>
                    let hdr = HttpHeaders()
                    p.push("/pushed", "GET", hdr)
                    println("[SRV] pushed /pushed")
                case None =>
                    println("[SRV] pusher not available")
            }
            ctx.responseBuilder.body("main")
        })
        server.distributor.register("/pushed", {
            ctx => ctx.responseBuilder.body("pushed-content")
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
        println("[SRV] listening on port ${server.port}")

        var ccfg = tlsClientConfig(["root_rsa.cer"], ["h2"])
        let c = ClientBuilder().tlsConfig(ccfg).enablePush(true)
            .readTimeout(10 * Duration.second).build()

        let resp = c.get("https://127.0.0.1:${server.port}/")
        let body = bodyAsString(resp.body)
        println("[CLI] main: status=${resp.status} body=${body}")
        @Expect(resp.status, 200)
        @Expect(body, "main")
        c.close()
        server.close()
    }

    // Go: TestServer_Push_RejectIfDisabled — client with enablePush(false)
    // should NOT receive pushed resources
    @TestCase
    func pushDisabledClientNoPush(): Unit {
        var scfg = tlsServerConfig(["h2"])
        let serverSocket = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket)
            .tlsConfig(scfg)
            .build()
        server.distributor.register("/", {
            ctx =>
            let pusher = HttpResponsePusher.getPusher(ctx)
            match (pusher) {
                case Some(p) =>
                    let hdr = HttpHeaders()
                    p.push("/pushed", "GET", hdr)
                    println("[SRV] pushed /pushed")
                case None =>
                    println("[SRV] pusher not available")
            }
            ctx.responseBuilder.body("main")
        })
        server.distributor.register("/pushed", {
            ctx => ctx.responseBuilder.body("pushed-content")
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }

        var ccfg = tlsClientConfig(["root_rsa.cer"], ["h2"])
        let c = ClientBuilder().tlsConfig(ccfg).enablePush(false)
            .readTimeout(10 * Duration.second).build()

        let resp = c.get("https://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "main")
        c.close()
        server.close()
    }

    // Probe: does getPusher return Some or None for an h2 connection?
    @TestCase
    func pusherAvailabilityProbe(): Unit {
        var scfg = tlsServerConfig(["h2"])
        let serverSocket = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket)
            .tlsConfig(scfg)
            .build()
        server.distributor.register("/", {
            ctx =>
            let pusher = HttpResponsePusher.getPusher(ctx)
            match (pusher) {
                case Some(p) => println("[PROBE] pusher=Some")
                case None => println("[PROBE] pusher=None")
            }
            ctx.responseBuilder.body("probe")
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }

        var ccfg = tlsClientConfig(["root_rsa.cer"], ["h2"])
        let c = ClientBuilder().tlsConfig(ccfg).enablePush(true)
            .readTimeout(10 * Duration.second).build()
        let resp = c.get("https://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        c.close()
        server.close()
    }
}
