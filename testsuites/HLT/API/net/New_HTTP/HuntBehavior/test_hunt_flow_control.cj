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

func fcPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func fcReadBody(resp: HttpResponse): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(65536, repeat: 0)
    while (true) {
        let n = resp.body.read(chunk)
        if (n <= 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func fcH2Client(): Client {
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    ccfg.supportedAlpnProtocols = ["h2"]
    return ClientBuilder().tlsConfig(ccfg).readTimeout(15 * Duration.second).build()
}

@Test
class HuntFlowControl {
    @TestCase
    func fcLargeResponse1MB(): Unit {
        var cfg = TlsServerConfig(X509Certificate.decodeFromPem(fcPem("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(fcPem("end_rsa_private_key.pem")))
        cfg.supportedAlpnProtocols = ["h2"]
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        server.distributor.register("/", { ctx =>
            let data = Array<UInt8>(1048576, repeat: 0x41)
            ctx.responseBuilder.body(data)
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
        let port = Int64(server.port)
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        ccfg.supportedAlpnProtocols = ["h2"]
        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(15 * Duration.second).build()
        try {
            let r = c.get("https://127.0.0.1:${port}/")
            let body = fcReadBody(r)
            println("[FC1MB] status=${r.status} size=${body.size}")
            @Expect(r.status, 200)
            @Expect(body.size, 1048576)
            @Expect(body[0], UInt8(0x41))
            @Expect(body[1048575], UInt8(0x41))
        } catch (e: Exception) {
            @Fail("FC1MB EXC: ${e}")
        }
        c.close()
        server.close()
    }

    @TestCase
    func fcLargeUpload1MB(): Unit {
        var cfg = TlsServerConfig(X509Certificate.decodeFromPem(fcPem("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(fcPem("end_rsa_private_key.pem")))
        cfg.supportedAlpnProtocols = ["h2"]
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        server.distributor.register("/echo", { ctx =>
            let buffer = ArrayList<UInt8>()
            let chunk = Array<UInt8>(65536, repeat: 0)
            while (true) {
                let n = ctx.request.body.read(chunk)
                if (n <= 0) { break }
                for (i in 0..n) { buffer.add(chunk[i]) }
            }
            ctx.responseBuilder.body("echo-${buffer.toArray().size}")
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
        let port = Int64(server.port)
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        ccfg.supportedAlpnProtocols = ["h2"]
        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(15 * Duration.second).build()
        try {
            let data = Array<UInt8>(1048576, repeat: 0x43)
            let r = c.send(HttpRequestBuilder().method("POST")
                .url("https://127.0.0.1:${port}/echo")
                .body(String.fromUtf8(data))
                .build())
            let bodyStr = String.fromUtf8(fcReadBody(r))
            println("[FC-UPLOAD] status=${r.status} body=[${bodyStr}]")
            @Expect(r.status, 200)
            @Expect(bodyStr, "echo-1048576")
        } catch (e: Exception) {
            @Fail("FC-UPLOAD EXC: ${e}")
        }
        c.close()
        server.close()
    }

    @TestCase
    func pushLargeData200k(): Unit {
        var cfg = TlsServerConfig(X509Certificate.decodeFromPem(fcPem("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(fcPem("end_rsa_private_key.pem")))
        cfg.supportedAlpnProtocols = ["h2"]
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        server.distributor.register("/", { ctx =>
            let pusher = HttpResponsePusher.getPusher(ctx)
            match (pusher) {
                case Some(p) => p.push("/pushed", "GET", HttpHeaders())
                case None => ()
            }
            ctx.responseBuilder.body("main")
        })
        server.distributor.register("/pushed", { ctx =>
            let data = Array<UInt8>(204800, repeat: 0x50)
            ctx.responseBuilder.body(data)
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
        let port = Int64(server.port)
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        ccfg.supportedAlpnProtocols = ["h2"]
        let c = ClientBuilder().tlsConfig(ccfg).enablePush(true)
            .readTimeout(15 * Duration.second).build()
        try {
            let r = c.get("https://127.0.0.1:${port}/")
            let bodyStr = String.fromUtf8(fcReadBody(r))
            println("[PUSH-200K] status=${r.status} body=[${bodyStr}]")
            @Expect(r.status, 200)
            @Expect(bodyStr, "main")
        } catch (e: Exception) {
            @Fail("PUSH-200K EXC: ${e}")
        }
        c.close()
        server.close()
    }
}
