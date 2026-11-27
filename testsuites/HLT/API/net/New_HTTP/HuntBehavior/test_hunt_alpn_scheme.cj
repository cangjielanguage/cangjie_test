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

func asReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func asBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(asReadAll(resp.body))
}

func asPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func asPlainSrv(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/", { ctx => ctx.responseBuilder.body("plain-ok") })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func asH2Srv(): Server {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(asPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(asPem("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["h2"]
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
    s.distributor.register("/", { ctx => ctx.responseBuilder.body("h2-ok") })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func asH2AlpnClient(): Client {
    var cfg = TlsClientConfig()
    cfg.verifyMode = TrustAll
    cfg.supportedAlpnProtocols = ["h2"]
    return ClientBuilder().tlsConfig(cfg).readTimeout(5 * Duration.second).build()
}

func asH2H1AlpnClient(): Client {
    var cfg = TlsClientConfig()
    cfg.verifyMode = TrustAll
    cfg.supportedAlpnProtocols = ["h2", "http/1.1"]
    return ClientBuilder().tlsConfig(cfg).readTimeout(5 * Duration.second).build()
}

@Test
class HuntAlpnScheme {
    @TestCase
    func alpnH2WithH1FallbackPlainHttpTarget(): Unit {
        let s = asPlainSrv()
        let c = asH2H1AlpnClient()
        try {
            let r = c.get("http://127.0.0.1:${Int64(s.port)}/")
            @Expect(asBodyOf(r), "plain-ok")
        } catch (e: Exception) {
            @Fail("ALPN [h2,http/1.1] client must serve plain http targets: ${e}")
        }
        c.close()
        s.close()
    }

    @TestCase
    func alpnH2OnlyPlainHttpTarget(): Unit {
        let s = asPlainSrv()
        let c = asH2AlpnClient()
        try {
            let r = c.get("http://127.0.0.1:${Int64(s.port)}/")
            @Expect(asBodyOf(r), "plain-ok")
        } catch (e: Exception) {
            @Fail("ALPN [h2] client must serve plain http targets: ${e}")
        }
        c.close()
        s.close()
    }

    @TestCase
    func alpnH2HttpsStillNegotiatesH2(): Unit {
        let s = asH2Srv()
        let c = asH2AlpnClient()
        let r = c.get("https://127.0.0.1:${Int64(s.port)}/")
        @Expect(asBodyOf(r), "h2-ok")
        c.close()
        s.close()
    }

    @TestCase
    func requestVersionOverrideEscapeHatch(): Unit {
        let s = asPlainSrv()
        let c = asH2AlpnClient()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/")
            .version(HTTP1_1).build()
        let r = c.send(req)
        @Expect(asBodyOf(r), "plain-ok")
        c.close()
        s.close()
    }
}
