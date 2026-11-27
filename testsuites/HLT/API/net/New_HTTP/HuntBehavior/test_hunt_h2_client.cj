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

func hhReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func hhBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(hhReadAll(resp.body))
}

func hhPemOf(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func hhStartH2Srv(): Server {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(hhPemOf("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(hhPemOf("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["h2"]
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg)
        .maxRequestHeaderSize(1048576).build()
    s.distributor.register("/hdrs", { ctx =>
        let n = ctx.request.headers.get("x-big").size
        ctx.responseBuilder.body("received-${n}")
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func hhH2Client(maxHeaderList: UInt32): Client {
    var cfg = TlsClientConfig()
    cfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(hhPemOf("root_rsa.cer")).map({c => c}))
    cfg.supportedAlpnProtocols = ["h2"]
    return ClientBuilder().tlsConfig(cfg).maxHeaderListSize(maxHeaderList)
        .readTimeout(8 * Duration.second).build()
}

@Test
class HuntH2Client {
    @TestCase
    func h2SmallHeadersOk(): Unit {
        let s = hhStartH2Srv()
        let c = hhH2Client(UInt32.Max)
        let r = c.send(HttpRequestBuilder().url("https://127.0.0.1:${s.port}/hdrs")
            .header("x-big", "small").build())
        @Expect(r.version, Protocol.HTTP2_0)
        @Expect(r.status, 200)
        @Expect(hhBodyOf(r), "received-1")
        c.close(); s.close()
    }

    @TestCase
    func h2RequestHeadersOver8kSent(): Unit {
        let s = hhStartH2Srv()
        let c = hhH2Client(UInt32.Max)
        var sent = false
        var detail = ""
        try {
            let b = HttpRequestBuilder().url("https://127.0.0.1:${s.port}/hdrs")
            for (i in 0..10) {
                b.header("x-big", String.fromUtf8(Array<UInt8>(1024, repeat: 97)))
            }
            let r = c.send(b.build())
            sent = r.status == 200
            detail = "status=${r.status} body=${hhBodyOf(r)}"
        } catch (e: Exception) {
            detail = "exception ${e}"
        }
        println("[hunt-h2] 10KB headers: ${detail}")
        @Expect(sent, true)
        c.close(); s.close()
    }

    @TestCase
    func h2MaxHeaderListSizeLiftsLimit(): Unit {
        let s = hhStartH2Srv()
        let c = hhH2Client(1048576u32)
        var sent = false
        var detail = ""
        try {
            let b = HttpRequestBuilder().url("https://127.0.0.1:${s.port}/hdrs")
            for (i in 0..10) {
                b.header("x-big", String.fromUtf8(Array<UInt8>(1024, repeat: 97)))
            }
            let r = c.send(b.build())
            sent = r.status == 200
            detail = "status=${r.status} body=${hhBodyOf(r)}"
        } catch (e: Exception) {
            detail = "exception ${e}"
        }
        println("[hunt-h2] 10KB headers + maxHeaderListSize(1MB): ${detail}")
        @Expect(sent, true)
        c.close(); s.close()
    }

    @TestCase
    func h2ServerMaxConcurrentStreamsZeroClearError(): Unit {
        var scfg = TlsServerConfig(X509Certificate.decodeFromPem(hhPemOf("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(hhPemOf("end_rsa_private_key.pem")))
        scfg.supportedAlpnProtocols = ["h2"]
        let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(scfg)
            .maxConcurrentStreams(0u32).build()
        s.distributor.register("/", { ctx => ctx.responseBuilder.body("z-ok") })
        spawn { s.serve() }
        while (s.port == 0) { sleep(Duration.millisecond) }
        let c = hhH2Client(UInt32.Max)
        var handled = false
        var detail = ""
        try {
            let r = c.get("https://127.0.0.1:${s.port}/")
            handled = r.status == 200
            detail = "status=${r.status} body=${hhBodyOf(r)}"
        } catch (e: Exception) {
            detail = "exception ${e}"
        }
        println("[hunt-h2] maxConcurrentStreams=0: ${detail}")
        @Expect(handled, true)
        c.close(); s.close()
    }

    @TestCase
    func h2HandlerExceptionMessageLeaked(): Unit {
        var scfg = TlsServerConfig(X509Certificate.decodeFromPem(hhPemOf("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(hhPemOf("end_rsa_private_key.pem")))
        scfg.supportedAlpnProtocols = ["h2"]
        let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(scfg).build()
        s.distributor.register("/", { ctx =>
            ctx.responseBuilder.header("content-type", "text/plain").body("partial")
            throw HttpException("secret-internal-path:/db/connection")
        })
        spawn { s.serve() }
        while (s.port == 0) { sleep(Duration.millisecond) }

        let c = hhH2Client(UInt32.Max)
        var body = ""
        var status: UInt16 = 0
        try {
            let r = c.get("https://127.0.0.1:${Int64(s.port)}/")
            status = r.status
            body = hhBodyOf(r)
        } catch (e: Exception) {
            body = "exception: ${e}"
        }
        println("[hunt-h2] h2 handler throw: status=${status} body=[${body}]")
        @Expect(body.contains("secret-internal-path"), false)
        c.close(); s.close()
    }

    @TestCase
    func h1HandlerExceptionNoLeak(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/", { ctx =>
            ctx.responseBuilder.header("content-type", "text/plain").body("partial")
            throw HttpException("secret-internal-path:/db/connection")
        })
        spawn { s.serve() }
        while (s.port == 0) { sleep(Duration.millisecond) }

        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let r = c.get("http://127.0.0.1:${Int64(s.port)}/")
            let body = hhBodyOf(r)
            println("[hunt-h2] h1 handler throw: status=${r.status} body=[${body}]")
            @Expect(body.contains("secret-internal-path"), false)
            @Expect(body.contains("Internal Server Error"), true)
        } catch (e: Exception) {
            println("[hunt-h2] h1 exception ${e}")
            @Expect(false, true)
        }
        c.close(); s.close()
    }
}
