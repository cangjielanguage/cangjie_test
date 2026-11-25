/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../tls/files
// DEPENDENCE: ../../../../asan
// DEPENDENCE: ../config
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt config/tlsconfig.cj -o tlsconfig.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle tlsconfig.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Plain and TLS requests to the same host:port share one engine and
 *      its poolSize connection limit, while idle connections are pooled per
 *      protocol. When every slot is held by idle TLS connections, a
 *      plain-http request must reclaim one of them instead of waiting
 *      forever (issue #1090 follow-up).
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.tls.*
import stdx.net.tls.common.*
import std.net.*
import std.sync.*
import std.time.*
import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*
import stdx.encoding.url.*
import std.io.*
import std.collection.*
import {asan.*, tlsconfig.*}

// serve TLS keep-alive requests: handshake, then loop over request heads
// answering with a 204 no-content response after a delay
func serveTlsQueueConn(tlsSocket: TlsSocket, delayMs: Int64): Unit {
    let buf = Array<UInt8>(4096, repeat: 0)
    var acc = ArrayList<UInt8>()
    while (true) {
        var headEnd = 0
        var found = false
        if (acc.size >= 4) {
            for (i in 0..(acc.size - 3)) {
                if (acc[i] == 13 && acc[i + 1] == 10 && acc[i + 2] == 13 && acc[i + 3] == 10) {
                    headEnd = i + 4
                    found = true
                    break
                }
            }
        }
        if (found) {
            var rest = ArrayList<UInt8>()
            for (i in headEnd..acc.size) {
                rest.add(acc[i])
            }
            acc = rest
            sleep(Duration.millisecond * delayMs)
            try {
                tlsSocket.write("HTTP/1.1 204 no content\r\n\r\n".toArray())
            } catch (e: Exception) {
                return
            }
        } else {
            var n = 0
            try {
                n = tlsSocket.read(buf)
            } catch (e: Exception) {
                return
            }
            if (n <= 0) {
                return
            }
            for (i in 0..n) {
                acc.add(buf[i])
            }
        }
    }
}

@Test
class TestClient1_1CrossProtocolQueue {
    let serverSocket = TcpServerSocket(bindAt: 0)

    // all poolSize slots are held by idle TLS connections; a plain-http
    // request to the same host:port reclaims one idle TLS connection and
    // then fails fast on the protocol mismatch instead of hanging forever
    @TestCase
    func crossProtocolQueueDoesNotHang(): Unit {
        let fut = spawn {
            serverSocket.bind()
            while (true) {
                try {
                    let socket = serverSocket.accept()
                    spawn {
                        var tmpCfg = serverConfig()
                        tmpCfg.supportedAlpnProtocols = ["http/1.1"]
                        let cfg = tmpCfg
                        try (tlsSocket = TlsSocket.server(socket, serverConfig: cfg)) {
                            try {
                                tlsSocket.handshake()
                                serveTlsQueueConn(tlsSocket, 200)
                                ()
                            } catch (e: Exception) {
                                // a plain-http request reaching the TLS port
                                // fails the handshake: close and move on
                                ()
                            }
                        }
                    }
                } catch (e: SocketException) {
                    break
                }
            }
        }
        sleep(Duration.second)
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        var cfg = clientConfig()
        cfg.supportedAlpnProtocols = ["http/1.1"]
        let client = ClientBuilder().readTimeout(10 * Duration.second).tlsConfig(cfg).build()

        // occupy the whole poolSize (default 10) with idle TLS connections
        let okCount = AtomicInt64(0)
        let n = 10
        for (_ in 0..n) {
            spawn {
                try {
                    let resp = client.send(HttpRequestBuilder().url(URL.parse("https://127.0.0.1:${port}/a")).build())
                    let buf = Array<UInt8>(1024, repeat: 0)
                    while (resp.body.read(buf) > 0) {}
                    okCount.fetchAdd(1)
                    ()
                } catch (e: Exception) {
                    ()
                }
            }
        }
        var waited = 0
        while (okCount.load() < n && waited < 100) {
            sleep(Duration.millisecond * 100)
            waited++
        }
        @Expect(okCount.load(), n)

        // a plain-http request to the same host:port must not hang forever
        let result = AtomicInt64(0) // 0 pending, 1 ok, 2 failed fast
        spawn {
            try {
                let _ = client.send(HttpRequestBuilder().url(URL.parse("http://127.0.0.1:${port}/a")).build())
                result.store(1)
            } catch (e: Exception) {
                result.store(2)
            }
        }
        waited = 0
        while (result.load() == 0 && waited < 50) {
            sleep(Duration.millisecond * 100)
            waited++
        }
        @Assert(result.load() != 0)

        client.close()
        serverSocket.close()
        fut.get()
        println("cross_protocol_queue_test")
        asanGC()
    }
}

/* SCAN-IN
cross_protocol_queue_test
 */
