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
import stdx.encoding.url.*
import std.net.*
import std.io.*
import std.convert.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func sfPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func sfReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(65536, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func sfBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(sfReadAll(resp.body))
}

var sfPort = 0

func sfSetupAndStart(): Server {
    try { Directory.create("sf_dl") } catch (e: Exception) { () }
    let f1 = File("sf_dl/hello.txt", Write)
    f1.write("0123456789ABCDEF".toArray().map({ b => UInt8(b) }))
    f1.close()
    let f2 = File("sf_dl/empty.txt", Write)
    f2.close()
    let f3 = File("sf_dl/large.txt", Write)
    let big = ArrayList<UInt8>()
    for (i in 0..(64 * 1024)) { big.add(UInt8(i % 251)) }
    f3.write(big.toArray())
    f3.close()
    let f4 = File("sf_dl/数据中文.txt", Write)
    f4.write("中文内容".toArray().map({ b => UInt8(b) }))
    f4.close()

    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/hello", FileHandler("sf_dl/hello.txt", handlerType: DownLoad))
    s.distributor.register("/hello-bs1", FileHandler("sf_dl/hello.txt", handlerType: DownLoad, bufferSize: 1))
    s.distributor.register("/empty", FileHandler("sf_dl/empty.txt", handlerType: DownLoad))
    s.distributor.register("/large", FileHandler("sf_dl/large.txt", handlerType: DownLoad))
    s.distributor.register("/large-bs1", FileHandler("sf_dl/large.txt", handlerType: DownLoad, bufferSize: 1))
    s.distributor.register("/chinese", FileHandler("sf_dl/数据中文.txt", handlerType: DownLoad))
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    sfPort = Int64(s.port)
    return s
}

@Test
class FileHandlerSingleFile {
    var server: Server
    var client: Client

    init() {
        server = sfSetupAndStart()
        client = ClientBuilder().readTimeout(10 * Duration.second).build()
    }

    ~init() {
        client.close()
        server.close()
    }

    @TestCase
    func rangeRequestIgnored(): Unit {
        let r = client.send(HttpRequestBuilder().url("http://127.0.0.1:${sfPort}/hello")
            .header("range", "bytes=0-9").build())
        let body = String.fromUtf8(sfReadAll(r.body))
        let cr = r.headers.getFirst("content-range") ?? "None"
        println("[sf] range: status=${r.status} len=${body.size} cr=${cr} body=[${body}]")
        @Expect(r.status, 206)
        @Expect(cr != "None", true)
        @Expect(body.size, 10)
    }

    @TestCase
    func smallFileBufferSize1(): Unit {
        let r = client.get("http://127.0.0.1:${sfPort}/hello-bs1")
        let body = String.fromUtf8(sfReadAll(r.body))
        println("[sf] bs1 small: status=${r.status} body=[${body}]")
        @Expect(r.status, 200)
        @Expect(body, "0123456789ABCDEF")
    }

    @TestCase
    func largeFileBufferSize1(): Unit {
        let r = client.get("http://127.0.0.1:${sfPort}/large-bs1")
        let body = sfReadAll(r.body)
        var ok = body.size == 64 * 1024
        if (ok) { for (i in 0..body.size) { if (body[i] != UInt8(i % 251)) { ok = false; break } } }
        println("[sf] bs1 large: status=${r.status} size=${body.size} integrity=${ok}")
        @Expect(r.status, 200)
        @Expect(ok, true)
    }

    @TestCase
    func emptyFileDownload(): Unit {
        let r = client.get("http://127.0.0.1:${sfPort}/empty")
        let body = sfReadAll(r.body)
        println("[sf] empty: status=${r.status} len=${body.size}")
        @Expect(r.status, 200)
        @Expect(body.size, 0)
    }

    @TestCase
    func chineseFilenameDownload(): Unit {
        let r = client.get("http://127.0.0.1:${sfPort}/chinese")
        let body = String.fromUtf8(sfReadAll(r.body))
        println("[sf] chinese: status=${r.status} body=[${body}]")
        @Expect(r.status, 200)
        @Expect(body, "中文内容")
    }

    @TestCase
    func noContentTypeHeader(): Unit {
        let r = client.get("http://127.0.0.1:${sfPort}/hello")
        let ct = r.headers.getFirst("content-type") ?? "None"
        println("[sf] content-type: ${ct}")
        @Expect(ct != "None", true)
    }

    @TestCase
    func noContentLengthHeader(): Unit {
        let r = client.get("http://127.0.0.1:${sfPort}/hello")
        let cl = r.headers.getFirst("content-length") ?? "None"
        println("[sf] content-length: ${cl}")
        @Expect(cl != "None", true)
    }
}

@Test
class HttpLayerTlsConfig {
    var server: Server
    var client: Client

    init() {
        var scfg = TlsServerConfig(X509Certificate.decodeFromPem(sfPem("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(sfPem("end_rsa_private_key.pem")))
        scfg.supportedVersions = [TlsVersion.V1_2]
        let srv = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(scfg).build()
        srv.distributor.register("/", { ctx => ctx.responseBuilder.body("tls-ok") })

        var ccfg = TlsClientConfig()
        ccfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(sfPem("root_rsa.cer")).map({c => c}))
        ccfg.supportedVersions = [TlsVersion.V1_2]
        let clt = ClientBuilder().tlsConfig(ccfg).readTimeout(5 * Duration.second).build()

        server = srv
        client = clt
        spawn { server.serve() }
    }

    ~init() {
        client.close()
        server.close()
    }

    @TestCase
    func httpLayerSupportedVersions(): Unit {
        let r = client.get("http://127.0.0.1:${Int64(server.port)}/")
        println("[hlt-tls] status=${r.status}")
        @Expect(r.status, 200)
    }

    @TestCase
    func httpLayerKeylogCallback(): Unit {
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(sfPem("root_rsa.cer")).map({c => c}))
        ccfg.supportedVersions = [TlsVersion.V1_2]
        let keylogFired = AtomicBool(false)
        let callback: ?(TlsSocket, String) -> Unit = Some({ sock, line =>
            if (line.size > 0) { keylogFired.store(true) }
        })
        ccfg.keylogCallback = callback
        let c2 = ClientBuilder().tlsConfig(ccfg).readTimeout(5 * Duration.second).build()
        let r = c2.get("https://127.0.0.1:${Int64(server.port)}/")
        println("[hlt-tls] keylog fired=${keylogFired.load()} status=${r.status}")
        @Expect(keylogFired.load(), true)
        @Expect(r.status, 200)
        c2.close()
    }
}
