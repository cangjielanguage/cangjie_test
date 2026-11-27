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

func gaPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func gaH2ServerCfg(): TlsServerConfig {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(gaPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(gaPem("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["h2"]
    return cfg
}

func gaH2ClientCfg(): TlsClientConfig {
    var cfg = TlsClientConfig()
    cfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(gaPem("root_rsa.cer")).map({c => c}))
    cfg.supportedAlpnProtocols = ["h2"]
    return cfg
}

func gaReadToEnd(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func gaH2Get(client: Client, port: Int64, seq: String): (Bool, String) {
    try {
        let r = client.send(HttpRequestBuilder().url("https://127.0.0.1:${port}/req")
            .header("x-seq", seq).build())
        let body = String.fromUtf8(gaReadToEnd(r.body))
        return (r.status == 200 && body == "resp-${seq}", "status=${r.status} body=${body} ver=${r.version}")
    } catch (e: Exception) {
        return (false, "${e}")
    }
}

func gaStartH2Server(port: UInt16): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(port).tlsConfig(gaH2ServerCfg()).build()
    s.distributor.register("/req", { ctx =>
        let seq = ctx.request.headers.getFirst("x-seq") ?? "none"
        ctx.responseBuilder.body("resp-${seq}")
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

@Test
class GaH2Goaway {
    @TestCase
    func h2ConnectionReuse(): Unit {
        let s = gaStartH2Server(0)
        let c = ClientBuilder().tlsConfig(gaH2ClientCfg()).readTimeout(5 * Duration.second).build()
        for (i in 0..5) {
            let (ok, detail) = gaH2Get(c, Int64(s.port), "seq-${i}")
            println("[ga] req-${i}: ok=${ok} ${detail}")
            @Expect(ok, true)
        }
        c.close(); s.close()
    }

    @TestCase
    func h2ConcurrentMultiplexing(): Unit {
        let s = gaStartH2Server(0)
        let c = ClientBuilder().tlsConfig(gaH2ClientCfg()).readTimeout(10 * Duration.second).build()
        let okCount = AtomicInt64(0)
        let errCount = AtomicInt64(0)
        for (i in 0..10) {
            let seq = "mux-${i}"
            spawn {
                let (ok, detail) = gaH2Get(c, Int64(s.port), seq)
                if (ok) {
                    okCount.fetchAdd(1)
                } else {
                    errCount.fetchAdd(1)
                    println("[ga] ${seq} FAIL: ${detail}")
                }
                ()
            }
        }
        sleep(Duration.second * 5)
        println("[ga] mux: ok=${okCount.load()} err=${errCount.load()}")
        @Expect(okCount.load(), 10)
        @Expect(errCount.load(), 0)
        c.close(); s.close()
    }

    @TestCase
    func h2GracefulCloseRestartTransparentReconnect(): Unit {
        let s = gaStartH2Server(0)
        let port = Int64(s.port)
        let c = ClientBuilder().tlsConfig(gaH2ClientCfg()).readTimeout(5 * Duration.second).build()
        let (ok1, d1) = gaH2Get(c, port, "pre-close")
        println("[ga] pre-close: ok=${ok1} ${d1}")
        @Expect(ok1, true)
        s.closeGracefully()
        sleep(Duration.millisecond * 300)

        let s2 = gaStartH2Server(UInt16(port))
        sleep(Duration.millisecond * 300)
        let (ok2, d2) = gaH2Get(c, port, "post-restart")
        println("[ga] post-restart: ok=${ok2} ${d2}")
        @Expect(ok2, true)
        c.close(); s2.close()
    }

    @TestCase
    func h2AbruptCloseRestartTransparentReconnect(): Unit {
        let s = gaStartH2Server(0)
        let port = Int64(s.port)
        let c = ClientBuilder().tlsConfig(gaH2ClientCfg()).readTimeout(5 * Duration.second).build()
        let (ok1, d1) = gaH2Get(c, port, "pre-abort")
        println("[ga] pre-abort: ok=${ok1} ${d1}")
        @Expect(ok1, true)
        s.close()
        sleep(Duration.millisecond * 300)

        let s2 = gaStartH2Server(UInt16(port))
        sleep(Duration.millisecond * 300)
        let (ok2, d2) = gaH2Get(c, port, "post-abort")
        println("[ga] post-abort: ok=${ok2} ${d2}")
        @Expect(ok2, true)
        c.close(); s2.close()
    }
}
