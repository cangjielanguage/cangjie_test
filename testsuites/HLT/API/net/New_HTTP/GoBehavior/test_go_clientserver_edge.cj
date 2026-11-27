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

func rawClient(): Client {
    return ClientBuilder().readTimeout(5 * Duration.second).build()
}

@Test
class GoClientServerEdgeTest {
    @TestCase
    func noBodyStatuses(): Unit {
        let server = startServer({
            s =>
            s.distributor.register("/200", { ctx => ctx.responseBuilder.status(200) })
            s.distributor.register("/204", { ctx => ctx.responseBuilder.status(204) })
            s.distributor.register("/404", { ctx => ctx.responseBuilder.status(404) })
        })
        let c = rawClient()
        let r1 = c.get("http://127.0.0.1:${server.port}/200")
        @Expect(r1.status, 200)
        @Expect(bodyAsString(r1.body), "")
        let r2 = c.get("http://127.0.0.1:${server.port}/204")
        @Expect(r2.status, 204)
        @Expect(bodyAsString(r2.body), "")
        let r3 = c.get("http://127.0.0.1:${server.port}/404")
        @Expect(r3.status, 404)
        @Expect(bodyAsString(r3.body), "")
        c.close()
        server.close()
    }
    @TestCase
    func status304IgnoresBody(): Unit {
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            sock.write("HTTP/1.1 304 Not Modified\r\nContent-Length: 5\r\n\r\nhello".toArray())
            sock.close()
        })
        let c = rawClient()
        let resp = c.get("http://127.0.0.1:${port}/")
        @Expect(resp.status, 304)
        @Expect(bodyAsString(resp.body), "")
        c.close()
        s.close()
    }
    @TestCase
    func handlerWritesTooMuch(): Unit {
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 5\r\n\r\n5-bytes-and-extra-garbage".toArray())
            sock.close()
        })
        let c = rawClient()
        let resp = c.get("http://127.0.0.1:${port}/")
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "5-byt")
        c.close()
        s.close()
    }
    @TestCase
    func closeDelimitedBody(): Unit {
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nclose-delimited-body".toArray())
            sock.close()
        })
        let c = rawClient()
        let resp = c.get("http://127.0.0.1:${port}/")
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "close-delimited-body")
        c.close()
        s.close()
    }
    @TestCase
    func identityTransferEncoding(): Unit {
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nTransfer-Encoding: identity\r\nContent-Length: 5\r\n\r\nhello".toArray())
            sock.close()
        })
        let c = rawClient()
        try {
            let resp = c.get("http://127.0.0.1:${port}/")
            @Expect(resp.status, 200)
            @Expect(bodyAsString(resp.body), "hello")
        } catch (e: Exception) {
            @Expect(e.message.contains("Invalid transfer-encoding"))
        }
        c.close()
        s.close()
    }
    @TestCase
    func duplicateContentLengthRejected(): Unit {
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\nContent-Length: 5\r\n\r\nhello".toArray())
            sock.close()
        })
        let c = rawClient()
        try {
            let resp = c.get("http://127.0.0.1:${port}/")
            @Fail("duplicate Content-Length must be rejected, got ${resp.status}")
        } catch (e: Exception) {
            @Expect(e.message.size > 0)
        }
        c.close()
        s.close()
    }
    @TestCase
    func clTeConflictChunkedWins(): Unit {
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 5\r\nTransfer-Encoding: chunked\r\n\r\n6\r\nhello!\r\n0\r\n\r\n".toArray())
            sock.close()
        })
        let c = rawClient()
        try {
            let resp = c.get("http://127.0.0.1:${port}/")
            @Expect(resp.status, 200)
            @Expect(bodyAsString(resp.body), "hello!")
        } catch (e: Exception) {
            @Expect(e.message.contains("Both content-length and transfer-encoding"))
        }
        c.close()
        s.close()
    }
    @TestCase
    func transportRejectsInvalidHeaders(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("x") })
        })
        let c = rawClient()
        try {
            let req = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/")
                .header("X-Evil", "a\r\nInject: 1").build()
            let resp = c.send(req)
            @Fail("header injection must be rejected, got ${resp.status}")
        } catch (e: Exception) {
            @Expect(e.message.size > 0)
        }
        c.close()
        server.close()
    }
    @TestCase
    func zeroLengthPost(): Unit {
        let server = startServer({
            s => s.distributor.register("/", {
                ctx =>
                let n = bodyAsString(ctx.request.body).size
                ctx.responseBuilder.body("n=${n}")
            })
        })
        let c = rawClient()
        let req = HttpRequestBuilder().method("POST")
            .url("http://127.0.0.1:${server.port}/").build()
        let resp = c.send(req)
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "n=0")
        c.close()
        server.close()
    }
    @TestCase
    func badResponseAfterReadingBody(): Unit {
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nokGARBAGE-AFTER-BODY".toArray())
            drainRequestHead(sock)
            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 1\r\n\r\nZ".toArray())
            sock.close()
        })
        let c = rawClient()
        let r1 = c.get("http://127.0.0.1:${port}/a")
        @Expect(r1.status, 200)
        @Expect(bodyAsString(r1.body), "ok")
        let r2 = c.get("http://127.0.0.1:${port}/b")
        @Expect(r2.status, 200)
        @Expect(bodyAsString(r2.body), "Z")
        c.close()
        s.close()
    }
    @TestCase
    func readAfterEofReturnsZero(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        })
        let c = rawClient()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        @Expect(bodyAsString(resp.body), "ok")
        let again = resp.body.read(Array<UInt8>(16, repeat: 0))
        @Expect(again, 0)
        c.close()
        server.close()
    }
}
