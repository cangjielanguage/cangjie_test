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
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.net.*
import std.io.*
import std.convert.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func pePem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func peReadBody(resp: HttpResponse): String {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(8192, repeat: 0)
    while (true) {
        let n = resp.body.read(chunk)
        if (n <= 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return String.fromUtf8(buffer.toArray())
}

func peStartServer(pushHandler: (HttpContext) -> Unit): (Server, Int64) {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(pePem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(pePem("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["h2"]
    let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
    server.distributor.register("/", { ctx =>
        pushHandler(ctx)
        ctx.responseBuilder.body("main")
    })
    server.distributor.register("/pushed", { ctx =>
        ctx.responseBuilder.body("pushed-content")
    })
    server.distributor.register("/pushed2", { ctx =>
        ctx.responseBuilder.body("pushed-content-2")
    })
    spawn { server.serve() }
    while (server.port == 0) { sleep(Duration.millisecond) }
    return (server, Int64(server.port))
}

func peClient(): Client {
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    ccfg.supportedAlpnProtocols = ["h2"]
    return ClientBuilder().tlsConfig(ccfg).enablePush(true)
        .readTimeout(6 * Duration.second).build()
}

@Test
class HuntPushEdge {
    @TestCase
    func pushStorm5Pushes(): Unit {
        let (server, port) = peStartServer({ ctx =>
            let pusher = HttpResponsePusher.getPusher(ctx)
            match (pusher) {
                case Some(p) =>
                    p.push("/pushed", "GET", HttpHeaders())
                    p.push("/pushed2", "GET", HttpHeaders())
                    p.push("/pushed", "GET", HttpHeaders())
                    p.push("/pushed2", "GET", HttpHeaders())
                    p.push("/pushed", "GET", HttpHeaders())
                case None => ()
            }
        })
        let c = peClient()
        let r = c.get("https://127.0.0.1:${port}/")
        let body = peReadBody(r)
        c.close()
        server.close()
        println("[PUSH-STORM] status=${r.status} body=[${body}]")
        @Expect(r.status, 200)
        @Expect(body, "main")
    }

    @TestCase
    func pushNonexistentPath(): Unit {
        var cfg = TlsServerConfig(X509Certificate.decodeFromPem(pePem("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(pePem("end_rsa_private_key.pem")))
        cfg.supportedAlpnProtocols = ["h2"]
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        server.distributor.register("/", { ctx =>
            let pusher = HttpResponsePusher.getPusher(ctx)
            match (pusher) {
                case Some(p) => p.push("/nonexistent", "GET", HttpHeaders())
                case None => ()
            }
            ctx.responseBuilder.body("main")
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
        let port = Int64(server.port)
        let c = peClient()
        let r = c.get("https://127.0.0.1:${port}/")
        let body = peReadBody(r)
        c.close()
        server.close()
        println("[PUSH-NOPATH] status=${r.status} body=[${body}]")
        @Expect(r.status, 200)
        @Expect(body, "main")
    }

    @TestCase
    func multiRequestDemuxAfterPush(): Unit {
        let (server, port) = peStartServer({ ctx =>
            let pusher = HttpResponsePusher.getPusher(ctx)
            match (pusher) {
                case Some(p) => p.push("/pushed", "GET", HttpHeaders())
                case None => ()
            }
        })
        let c = peClient()
        let r1 = c.get("https://127.0.0.1:${port}/")
        let r2 = c.get("https://127.0.0.1:${port}/")
        let r3 = c.get("https://127.0.0.1:${port}/")
        let b1 = peReadBody(r1)
        let b2 = peReadBody(r2)
        let b3 = peReadBody(r3)
        c.close()
        server.close()
        println("[DEMUX] b1=[${b1}] b2=[${b2}] b3=[${b3}]")
        @Expect(b1, "main")
        @Expect(b2, "main")
        @Expect(b3, "main")
    }
}
