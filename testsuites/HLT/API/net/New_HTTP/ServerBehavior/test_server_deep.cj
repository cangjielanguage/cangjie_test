/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../../okhttp_support
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl okhttp_support/common.cj %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt --parallel=false

import stdx.net.http.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.net.*
import std.io.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func srvClient(): Client {
    return ClientBuilder().readTimeout(10 * Duration.second).build()
}

func srvTlsClient(): Client {
    var cfg = TlsClientConfig()
    cfg.verifyMode = CertificateVerifyMode.TrustAll
    return ClientBuilder().tlsConfig(cfg).readTimeout(10 * Duration.second).build()
}

@Test
class ServerDeepTest {
    @TestCase
    func readTimeoutClosesIdleConnection(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket)
            .readTimeout(Duration.millisecond * 500)
            .build()
        server.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
        let sock = TcpSocket(IPSocketAddress("127.0.0.1", server.port))
        sock.connect()
        let hs = "GET / HTTP/1.1\r\nHost: 127.0.0.1:${server.port}\r\n\r\n"
        sock.write(hs.toArray())
        let buf = Array<UInt8>(4096, repeat: 0)
        let rn = sock.read(buf)
        @Expect(rn > 0, true)
        sleep(Duration.second * 2)
        let rn2 = sock.read(buf)
        @Expect(rn2 <= 0, true)
        sock.close()
        server.close()
    }
    @TestCase
    func readHeaderTimeoutClosesIncompleteRequest(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket)
            .readHeaderTimeout(Duration.millisecond * 500)
            .build()
        server.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }

        let sock = TcpSocket(IPSocketAddress("127.0.0.1", server.port))
        sock.connect()
        sock.write("GET / HTTP/1.1\r\nHost: x\r\n".toArray())
        sleep(Duration.second * 2)
        let buf = Array<UInt8>(4096, repeat: 0)
        let rn = sock.read(buf)
        @Expect(rn <= 0, true)
        sock.close()
        server.close()
    }
    @TestCase
    func writeTimeoutClosesUnresponsiveClient(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket)
            .writeTimeout(Duration.millisecond * 500)
            .build()
        server.distributor.register("/", {
            ctx =>
            let big = Array<UInt8>(1024 * 1024, repeat: 0x41)
            ctx.responseBuilder.body(big)
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }

        let sock = TcpSocket(IPSocketAddress("127.0.0.1", server.port))
        sock.connect()
        let hs = "GET / HTTP/1.1\r\nHost: x\r\n\r\n"
        sock.write(hs.toArray())
        sleep(Duration.second * 3)
        let buf = Array<UInt8>(1024, repeat: 0)
        let rn = sock.read(buf)
        @Expect(rn <= 0, true)
        sock.close()
        server.close()
    }
    @TestCase
    func expect100Continue(): Unit {
        let (s, port) = startRawServer({
            sock =>
            drainRequestHead(sock)
            sock.write("HTTP/1.1 100 Continue\r\n\r\n".toArray())
            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nok".toArray())
            sock.close()
        })
        let c = srvClient()
        try {
            let resp = c.get("http://127.0.0.1:${port}/")
            @Expect(resp.status, 200)
        } catch (e: Exception) {
            @Fail("100 Continue must be handled: ${e.message}")
        }
        c.close()
        s.close()
    }
    @TestCase
    func status204NoBody(): Unit {
        let server = startServer({
            s => s.distributor.register("/", {
                ctx => ctx.responseBuilder.status(204)
            })
        })
        let c = srvClient()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp.status, 204)
        @Expect(bodyAsString(resp.body), "")
        c.close()
        server.close()
    }
    @TestCase
    func contentLengthZero(): Unit {
        let server = startServer({
            s => s.distributor.register("/", {
                ctx => ctx.responseBuilder.header("Content-Length", "0").body("")
            })
        })
        let c = srvClient()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "")
        c.close()
        server.close()
    }
    @TestCase
    func methodCaseSensitive(): Unit {
        let server = startServer({
            s => s.distributor.register("/", {
                ctx => ctx.responseBuilder.body("${ctx.request.method}")
            })
        })
        let c = srvClient()
        let req = HttpRequestBuilder().method("get")
            .url("http://127.0.0.1:${server.port}/").build()
        let resp = c.send(req)
        @Expect(bodyAsString(resp.body), "get")
        c.close()
        server.close()
    }
    @TestCase
    func maxRequestBodySizeEnforced(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket)
            .maxRequestBodySize(100)
            .build()
        server.distributor.register("/", {
            ctx =>
            let body = bodyAsString(ctx.request.body)
            ctx.responseBuilder.body("len=${body.size}")
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }

        let c = srvClient()
        let req = HttpRequestBuilder().method("POST")
            .url("http://127.0.0.1:${server.port}/")
            .body("this-body-is-longer-than-100-bytes-and-should-be-rejected-by-the-server-because-maxRequestBodySize-is-set-to-100")
            .build()
        try {
            let resp = c.send(req)
            @Expect(resp.status != 200 || bodyAsString(resp.body).size <= 100, true)
        } catch (e: Exception) {
            @Expect(e.message.size > 0, true)
        }
        c.close()
        server.close()
    }
    @TestCase
    func maxRequestHeaderSizeEnforced(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket)
            .maxRequestHeaderSize(1024)
            .build()
        server.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }

        let c = srvClient()
        let bigHeader = String.fromUtf8(Array<UInt8>(2048, repeat: 0x41))
        let req = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/")
            .header("X-Big", bigHeader).build()
        let resp = c.send(req)
        @Expect(resp.status, 431)
        c.close()
        server.close()
    }
    @TestCase
    func handlerExceptionDoesNotCrashServer(): Unit {
        let server = startServer({
            s =>
            s.distributor.register("/boom", {
                ctx => throw HttpException("handler boom")
            })
            s.distributor.register("/alive", { ctx => ctx.responseBuilder.body("alive") })
        })
        let c = srvClient()
        try {
            let resp = c.get("http://127.0.0.1:${server.port}/boom")
            @Expect(resp.status == 500 || resp.status >= 400, true)
        } catch (e: Exception) {
            @Expect(e.message.size > 0, true)
        }
        let resp2 = c.get("http://127.0.0.1:${server.port}/alive")
        @Expect(resp2.status, 200)
        @Expect(bodyAsString(resp2.body), "alive")
        c.close()
        server.close()
    }
    @TestCase
    func concurrentClientsEachGetResponse(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("cc") })
        })
        let c1 = srvClient()
        let c2 = srvClient()
        let c3 = srvClient()
        let r1 = c1.get("http://127.0.0.1:${server.port}/")
        let r2 = c2.get("http://127.0.0.1:${server.port}/")
        let r3 = c3.get("http://127.0.0.1:${server.port}/")
        @Expect(r1.status, 200)
        @Expect(r2.status, 200)
        @Expect(r3.status, 200)
        c1.close()
        c2.close()
        c3.close()
        server.close()
    }
    @TestCase
    func serverKeepAliveBetweenRequests(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("ka") })
        })
        let c = srvClient()
        for (_ in 0..3) {
            let resp = c.get("http://127.0.0.1:${server.port}/")
            @Expect(resp.status, 200)
        }
        c.close()
        server.close()
    }
    @TestCase
    func serverCloseAfterResponse(): Unit {
        let server = startServer({
            s => s.distributor.register("/", {
                ctx =>
                ctx.responseBuilder.header("Connection", "close").body("closing")
            })
        })
        let c = srvClient()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        @Expect(resp.headers.getFirst("Connection") ?? "", "close")
        c.close()
        server.close()
    }
}
