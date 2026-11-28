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
 *      Test HttpEngine1_1#getConn
 * Test API:
 *      private func getConn(index: Int64, isToProxy: Bool, forceNew!: Bool = false): ConnNode
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
class TestHttpEngine1_1GetConn {
    let serverSocket = TcpServerSocket(bindAt: 0)
    @TestCase
    func HttpEngine1_1GetConnPoolSize(): Unit {
        let fut = spawn {serverPacketCapture()}
        sleep(Duration.millisecond * 100)
        let client = ClientBuilder().poolSize(2).build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        let r = HttpRequestBuilder().url(u).build()

        // each connection is released once the body is fully consumed, so
        // all requests succeed instead of the third being rejected
        for (_ in 0..3) {
            let resp = client.send(r)
            let buf = Array<UInt8>(1024, repeat: 0)
            while (resp.body.read(buf) > 0) {}
        }

        client.close()
        fut.get()
        println("get_conn_poolSize_test")
        asanGC()
    }
    func serverPacketCapture() {
        serverSocket.bind()
        for (_ in 0..3) {
            let server = serverSocket.accept()
            // read the request before closing, otherwise the client would
            // receive an RST instead of a graceful EOF while reading the body
            var buf = Array<UInt8>(500, repeat: 0)
            var _ = server.read(buf)
            server.write("HTTP/1.1 200 ok\r\nconnection: close\r\n\r\n".toArray())
            server.close()
        }
        serverSocket.close()
    }
}

/* SCAN-IN
get_conn_poolSize_test
 */
