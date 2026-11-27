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

func pemCS(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func csStartServer(): (Server, Int64) {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(pemCS("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(pemCS("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["h2", "http/1.1"]
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
    s.distributor.register("/fast", { ctx =>
        ctx.responseBuilder.body("fast-ok")
    })
    s.distributor.register("/slow", { ctx =>
        sleep(Duration.millisecond * 100)
        ctx.responseBuilder.body("slow-ok")
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return (s, Int64(s.port))
}

func csH2Client(port: Int64): Client {
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    ccfg.supportedAlpnProtocols = ["h2", "http/1.1"]
    return ClientBuilder().tlsConfig(ccfg).readTimeout(10 * Duration.second).build()
}

func csH1Client(port: Int64, pool!: Int64 = 10): Client {
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    ccfg.supportedAlpnProtocols = ["http/1.1"]
    return ClientBuilder().tlsConfig(ccfg).poolSize(pool).readTimeout(10 * Duration.second).build()
}

func csReadBody(resp: HttpResponse): String {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(8192, repeat: 0)
    while (true) {
        let n = resp.body.read(chunk)
        if (n <= 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return String.fromUtf8(buffer.toArray())
}

@Test
class ConcurrentStress {
    @TestCase
    func concurrent10H2(): Unit {
        let (server, port) = csStartServer()
        let c = csH2Client(port)
        let results = ArrayList<String>()
        let mutex = Mutex()
        let errors = AtomicInt64(0)
        spawn {
            for (i in 0..10) {
                spawn {
                    try {
                        let r = c.get("https://127.0.0.1:${port}/fast")
                        let body = csReadBody(r)
                        mutex.lock()
                        results.add("req${i}=${r.status}/${body}")
                        mutex.unlock()
                    } catch (e: Exception) {
                        errors.fetchAdd(1)
                        mutex.lock()
                        results.add("req${i}=EXC:${e}")
                        mutex.unlock()
                    }
                }
            }
        }
        sleep(Duration.second * 5)
        c.close()
        server.close()
        println("[CS1] concurrent10H2 errors=${errors.load()} results=${results.size}")
        @Expect(errors.load(), 0)
    }

    @TestCase
    func concurrent10H1(): Unit {
        let (server, port) = csStartServer()
        let c = csH1Client(port)
        let results = ArrayList<String>()
        let errors = AtomicInt64(0)
        let mutex = Mutex()
        spawn {
            for (i in 0..10) {
                spawn {
                    try {
                        let r = c.get("https://127.0.0.1:${port}/fast")
                        let body = csReadBody(r)
                        mutex.lock()
                        results.add("req${i}=${r.status}/${body}")
                        mutex.unlock()
                    } catch (e: Exception) {
                        errors.fetchAdd(1)
                        mutex.lock()
                        results.add("req${i}=EXC:${e}")
                        mutex.unlock()
                    }
                }
            }
        }
        sleep(Duration.second * 5)
        c.close()
        server.close()
        println("[CS2] concurrent10H1 errors=${errors.load()} results=${results.size}")
        @Expect(errors.load(), 0)
    }

    @TestCase
    func sequential50H2(): Unit {
        let (server, port) = csStartServer()
        let c = csH2Client(port)
        var allOk = true
        for (i in 0..50) {
            try {
                let r = c.get("https://127.0.0.1:${port}/fast")
                let body = csReadBody(r)
                if (body != "fast-ok") { allOk = false; println("[CS3] req${i} body=[${body}]") }
            } catch (e: Exception) {
                allOk = false
                println("[CS3] req${i} EXC: ${e}")
            }
        }
        c.close()
        server.close()
        @Expect(allOk, true)
    }

    @TestCase
    func concurrentMixedAlpn(): Unit {
        let (server, port) = csStartServer()
        let errors = AtomicInt64(0)
        let results = ArrayList<String>()
        let mutex = Mutex()
        spawn {
            for (i in 0..5) {
                spawn {
                    try {
                        var ccfg = TlsClientConfig()
                        ccfg.verifyMode = TrustAll
                        ccfg.supportedAlpnProtocols = ["h2", "http/1.1"]
                        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(10 * Duration.second).build()
                        let r = c.get("https://127.0.0.1:${port}/fast")
                        mutex.lock()
                        results.add("h2-${i}=${r.status}")
                        mutex.unlock()
                        c.close()
                    } catch (e: Exception) {
                        errors.fetchAdd(1)
                        ()
                    }
                }
            }
            for (i in 0..5) {
                spawn {
                    try {
                        var ccfg = TlsClientConfig()
                        ccfg.verifyMode = TrustAll
                        ccfg.supportedAlpnProtocols = ["http/1.1"]
                        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(10 * Duration.second).build()
                        let r = c.get("https://127.0.0.1:${port}/fast")
                        mutex.lock()
                        results.add("h1-${i}=${r.status}")
                        mutex.unlock()
                        c.close()
                    } catch (e: Exception) {
                        errors.fetchAdd(1)
                        ()
                    }
                }
            }
        }
        sleep(Duration.second * 8)
        server.close()
        println("[CS4] mixedAlpn results=${results.size} errors=${errors.load()}")
        @Expect(errors.load(), 0)
    }

    @TestCase
    func clientCloseDuringInFlight(): Unit {
        let (server, port) = csStartServer()
        let c = csH2Client(port)
        var outcome = "?"
        try {
            let r = c.get("https://127.0.0.1:${port}/slow")
            c.close()
            outcome = "status=${r.status}"
        } catch (e: Exception) {
            outcome = "EXC: ${e}"
        }
        server.close()
        println("[CS5] closeDuringInFlight outcome=${outcome}")
    }

    @TestCase
    func concurrent20H1Pool(): Unit {
        let (server, port) = csStartServer()
        let c = csH1Client(port, pool: 20)
        let errors = AtomicInt64(0)
        let completed = AtomicInt64(0)
        spawn {
            for (i in 0..20) {
                spawn {
                    try {
                        let r = c.get("https://127.0.0.1:${port}/fast")
                        let body = csReadBody(r)
                        completed.fetchAdd(1)
                        ()
                    } catch (e: Exception) {
                        errors.fetchAdd(1)
                        ()
                    }
                }
            }
        }
        sleep(Duration.second * 8)
        c.close()
        server.close()
        println("[CS6] concurrent20H1Pool errors=${errors.load()} completed=${completed.load()}")
        @Expect(errors.load(), 0)
    }
}
