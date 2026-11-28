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
 *      Test Client1_1#reconnect connection when server close it, try again
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 *
 * Note: since issue #1090, a request beyond the connection limit queues for
 * a free connection; when the pooled connection turns out to be closed by
 * the server, the client reconnects transparently and the request succeeds.
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
import std.collection.*
import stdx.log.*

@Test
class TestClient1_1reconnect2 {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let mtx = ReentrantMutex()
    @TestCase
    func client1_1reconnect2(): Unit {
        let fut = spawn {serverPacketCapture1()}
        sleep(Duration.millisecond * 100)

        let client = ClientBuilder().build()
        client.logger.level = LogLevel.DEBUG
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        let u = URL.parse("http://127.0.0.1:${port}/a")
        for (_ in 0..10) {
            spawn {
                let r = HttpRequestBuilder().url(u).build()
                let response = client.send(r)
                @Expect(response.toString().contains("HTTP/1.1 204 No Content\r\n"))
            }
        }

        sleep(Duration.millisecond * 200)
        // the 11th request queues for a free connection; the pooled
        // connection was closed by the server, so the client transparently
        // reconnects and the request succeeds (issue #1090)
        let r = HttpRequestBuilder().url(u).build()
        @Expect(client.send(r).toString().contains("HTTP/1.1 204 No Content\r\n"))

        // waiting for all connections in the connection pool to be closed by the server
        sleep(Duration.second * 2)
        let r2 = HttpRequestBuilder().url(u).build()
        @Expect(client.send(r2).toString().contains("HTTP/1.1 204 No Content\r\n"))

        serverSocket.close()
        client.close()
        fut.get()
        println("ok")
        asanGC()
    }

    func serverPacketCapture1() {
        serverSocket.bind()
        let serverList = ArrayList<TcpSocket>()
        while (true) {
            try {
                let server = serverSocket.accept()
                spawn {
                    serve(server, serverList)
                }
            } catch (e: SocketException) {
                println("caught")
                break
            }
        }
        @Expect(serverList.size, 12)
    }

    func serve(server: TcpSocket, serverList: ArrayList<TcpSocket>) {
        let buf = Array<UInt8>(500, repeat: 0)
        let i = server.read(buf)
        let req = String.fromUtf8(buf[0..i])
        let port = (serverSocket.localAddress as IPSocketAddress)?.port ?? 0
        @Expect(req.contains("GET /a HTTP/1.1\r\nhost: 127.0.0.1:${port}\r\nuser-agent: CANGJIEUSERAGENT_1_1\r\n"))
        sleep(Duration.second * 1)
        server.write("HTTP/1.1 204 ok\r\n\r\n".toArray())
        mtx.lock()
        serverList.add(server)
        mtx.unlock()
        server.close()
    }
}

// ASSERT: scan ok
// ASSERT: scan caught
