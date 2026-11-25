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
 *      Requests exceeding the per-server connection limit (poolSize) queue
 *      for a free connection instead of being rejected with
 *      "Too many connections to the same server.", and a request still
 *      waiting when the client is closed is woken up with
 *      "Client is already closed." (issue #1090)
 * Test API:
 *      public func request(request: HttpRequest): HttpResponse
 */
package tests.client1_1

import stdx.net.http.*
import asan.*
import std.net.*
import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.collection.*
import std.io.*

// serve keep-alive requests in a loop: read one request head, delay,
// then respond with content-length: 2 body "ok"
func handleQueueConn(conn: TcpSocket, delayMs: Int64): Unit {
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
                conn.write("HTTP/1.1 200 ok\r\ncontent-length: 2\r\n\r\nok".toArray())
            } catch (e: Exception) {
                return
            }
        } else {
            var n = 0
            try {
                n = conn.read(buf)
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

func consumeBody(resp: HttpResponse): Unit {
    let buf = Array<UInt8>(1024, repeat: 0)
    while (resp.body.read(buf) > 0) {}
}

@Test
class TestClient1_1ConnLimitQueue {
    // 20 concurrent requests with poolSize(5): all requests succeed and at
    // most 5 connections are established
    @TestCase
    func concurrentRequestsQueueForFreeConnection(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let port = AtomicInt64(0)
        let connCount = AtomicInt64(0)
        let fut = spawn {
            serverSocket.bind()
            port.store(Int64((serverSocket.localAddress as IPSocketAddress)?.port ?? 0))
            while (true) {
                try {
                    let conn = serverSocket.accept()
                    connCount.fetchAdd(1)
                    spawn {
                        handleQueueConn(conn, 200)
                        conn.close()
                    }
                } catch (e: SocketException) {
                    break
                }
            }
        }
        while (port.load() == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().poolSize(5).readTimeout(10 * Duration.second).build()
        let okCount = AtomicInt64(0)
        let failCount = AtomicInt64(0)
        let n = 20
        for (_ in 0..n) {
            spawn {
                try {
                    let resp = client.get("http://127.0.0.1:${port.load()}/")
                    consumeBody(resp)
                    okCount.fetchAdd(1)
                } catch (e: Exception) {
                    println("unexpected exception: ${e.message}")
                    failCount.fetchAdd(1)
                }
            }
        }
        var waited = 0
        while (okCount.load() + failCount.load() < n && waited < 150) {
            sleep(Duration.millisecond * 100)
            waited++
        }
        @Expect(okCount.load(), n)
        @Expect(failCount.load(), 0)
        @Assert(connCount.load() <= 5)
        serverSocket.close()
        client.close()
        fut.get()
        println("concurrent_requests_queue_test")
        asanGC()
    }

    // a request waiting for a free connection is woken up by client.close()
    // and reports "Client is already closed." instead of hanging forever
    @TestCase
    func closeWakesUpWaitingRequest(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let port = AtomicInt64(0)
        let fut = spawn {
            serverSocket.bind()
            port.store(Int64((serverSocket.localAddress as IPSocketAddress)?.port ?? 0))
            while (true) {
                try {
                    let conn = serverSocket.accept()
                    spawn {
                        handleQueueConn(conn, 1000)
                        conn.close()
                    }
                } catch (e: SocketException) {
                    break
                }
            }
        }
        while (port.load() == 0) {
            sleep(Duration.millisecond)
        }

        let client = ClientBuilder().poolSize(1).readTimeout(10 * Duration.second).build()
        // occupy the only connection without consuming the body
        spawn {
            try {
                let _ = client.get("http://127.0.0.1:${port.load()}/occupied")
            } catch (e: Exception) {
                ()
            }
        }
        sleep(Duration.second)

        let result = AtomicInt64(0) // 0 pending, 1 ok, 2 closed, 3 other
        spawn {
            try {
                let resp = client.get("http://127.0.0.1:${port.load()}/waiting")
                consumeBody(resp)
                result.store(1)
            } catch (e: HttpException) {
                if (e.message.contains("Client is already closed")) {
                    result.store(2)
                } else {
                    result.store(3)
                }
            } catch (e: Exception) {
                result.store(3)
            }
        }
        sleep(Duration.second) // let the waiter block on the limit
        client.close()
        var waited = 0
        while (result.load() == 0 && waited < 50) {
            sleep(Duration.millisecond * 100)
            waited++
        }
        @Expect(result.load(), 2)
        serverSocket.close()
        fut.get()
        println("close_wakes_up_waiting_request_test")
        asanGC()
    }
}

/* SCAN-IN
concurrent_requests_queue_test
close_wakes_up_waiting_request_test
 */
