/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../../okhttp_support
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl okhttp_support/common.cj %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt --parallel=false

import stdx.net.http.*
import stdx.crypto.kit.*
import std.net.*
import std.io.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

var connSeq = AtomicInt64(0)

func newU1Client(): Client {
    return ClientBuilder().readTimeout(5 * Duration.second).build()
}

@Test
class UndiciPoolBehaviorTest {
    @TestCase
    func reconnectAfterDestroyedFirstRequest(): Unit {
        connSeq.store(0)
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            let seq = connSeq.fetchAdd(1)
            if (seq == 0) {
                sock.close()
            } else {
                sock.write("HTTP/1.1 200 OK\r\nContent-Length: 4\r\n\r\nOK-2".toArray())
                sock.close()
            }
        })
        let c = newU1Client()
        var firstFailed = false
        try {
            let r1 = c.get("http://127.0.0.1:${port}/")
            let t = bodyAsString(r1.body).size
            firstFailed = false
        } catch (e: Exception) {
            firstFailed = true
        }
        try {
            let r2 = c.get("http://127.0.0.1:${port}/")
            @Expect(r2.status, 200)
            @Expect(bodyAsString(r2.body), "OK-2")
        } catch (e: Exception) {
            @Fail("second request must succeed on a fresh connection: ${e.message}")
        }
        c.close()
        s.close()
    }
    @TestCase
    func malformedKeepAliveHeaderTolerated(): Unit {
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 0\r\nKeep-Alive: timeoutasdasd=1s\r\nConnection: keep-alive\r\n\r\n".toArray())
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 0\r\nConnection: close\r\n\r\n".toArray())
            sock.close()
        })
        let c = newU1Client()
        let r1 = c.get("http://127.0.0.1:${port}/")
        @Expect(r1.status, 200)
        @Expect(bodyAsString(r1.body), "")
        let r2 = c.get("http://127.0.0.1:${port}/")
        @Expect(r2.status, 200)
        c.close()
        s.close()
    }
    @TestCase
    func invalidResponseContentLengthRejected(): Unit {
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nContent-Length: abc\r\n\r\nhello".toArray())
            sock.close()
        })
        let c = newU1Client()
        try {
            let resp = c.get("http://127.0.0.1:${port}/")
            @Fail("invalid Content-Length must be rejected, got ${resp.status}")
        } catch (e: Exception) {
            @Expect(e.message.size > 0)
        }
        c.close()
        s.close()
    }
    @TestCase
    func numericKeepAliveHeaderTolerated(): Unit {
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 0\r\nKeep-Alive: timeout=1\r\nConnection: keep-alive\r\n\r\n".toArray())
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 0\r\nConnection: close\r\n\r\n".toArray())
            sock.close()
        })
        let c = newU1Client()
        let r1 = c.get("http://127.0.0.1:${port}/")
        @Expect(r1.status, 200)
        let r2 = c.get("http://127.0.0.1:${port}/")
        @Expect(r2.status, 200)
        c.close()
        s.close()
    }
    @TestCase
    func repeatedRequestsAfterDestroy(): Unit {
        connSeq.store(0)
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            let seq = connSeq.fetchAdd(1)
            if (seq == 0) {
                sock.close()
            } else {
                sock.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nhi".toArray())
                sock.close()
            }
        })
        let c = newU1Client()
        try {
            let _ = c.get("http://127.0.0.1:${port}/")
        } catch (e: Exception) {
        }
        for (i in 1..3) {
            let r = c.get("http://127.0.0.1:${port}/")
            @Expect(r.status, 200)
        }
        c.close()
        s.close()
    }
}
