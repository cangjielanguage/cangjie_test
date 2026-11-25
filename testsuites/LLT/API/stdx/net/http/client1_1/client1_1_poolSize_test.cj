/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../../../../asan
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %f asan.%middle -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

/*
 * Test description:
 *      Test poolSize
 * Test API:
 *      func sendRequest(request: HttpRequest): HttpResponse
 *
 * Note: since issue #1090, requests exceeding the per-server connection
 * limit queue for a free connection instead of throwing
 * "Too many connections to the same server."
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import stdx.encoding.url.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.sync.*
import stdx.log.*
import std.io.*

@Test
class TestClientPoolSize {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func clientPoolSizeInvalid(): Unit {
        try {
            ClientBuilder().poolSize(0).build()
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Invalid argument 'size': expected a positive value, got 0.")
        }
        try {
            ClientBuilder().poolSize(-1).build()
            @Expect(1, 2)
        } catch (e: HttpException) {
            @Expect(e.message, "Invalid argument 'size': expected a positive value, got -1.")
        }
    }
    @TestCase
    func clientPoolSize(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().poolSize(1).build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()
        // the only connection slot is released once the body is fully
        // consumed, so the next request must succeed instead of being
        // rejected with "Too many connections"
        let resp1 = client.send(r)
        consumeBody(resp1)
        let resp2 = client.send(r)
        consumeBody(resp2)
        client.close()
        fut.get()
        println("client_pool_size_test")
        asanGC()
    }
    func consumeBody(resp: HttpResponse): Unit {
        let buf = Array<UInt8>(1024, repeat: 0)
        while (resp.body.read(buf) > 0) {}
    }
    func serverPacketCapture() {
        serverSocket.bind()
        // server1 and server2, one connection per request
        for (_ in 0..2) {
            let server = serverSocket.accept()
            // read the request before closing, otherwise the client would
            // receive an RST instead of a graceful EOF while reading the body
            var buf = Array<UInt8>(500, repeat: 0)
            var _ = server.read(buf)
            sleep(Duration.millisecond * 100)
            server.write("HTTP/1.1 200 ok\r\nconnection: close\r\n\r\n".toArray())
            server.close()
        }
        serverSocket.close()
    }
}

/* SCAN-IN
client_pool_size_test
 */
