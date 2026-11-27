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

var connectorCalls = AtomicInt64(0)
var serverHits = AtomicInt64(0)

func newTransportClient(): Client {
    return ClientBuilder().readTimeout(5 * Duration.second).build()
}

class PayloadStream <: InputStream {
    let data: Array<UInt8>
    var pos: Int64 = 0
    init(data: Array<UInt8>) {
        this.data = data
    }
    public func read(buffer: Array<UInt8>): Int64 {
        if (pos >= data.size) {
            return 0
        }
        let n = if (buffer.size < data.size - pos) { buffer.size } else { data.size - pos }
        for (i in 0..n) {
            buffer[i] = data[pos + i]
        }
        pos += n
        return n
    }
}

@Test
class GoTransportBehaviorTest {
    @TestCase
    func concurrentRequestsOnOneClient(): Unit {
        serverHits.store(0)
        let server = startServer({
            s => s.distributor.register("/", {
                ctx =>
                serverHits.fetchAdd(1)
                ctx.responseBuilder.body("ok")
            })
        })
        let c = newTransportClient()
        let futures = ArrayList<Future<Unit>>()
        for (_ in 0..20) {
            futures.add(spawn {
                let resp = c.get("http://127.0.0.1:${server.port}/")
                @Expect(resp.status, 200)
            })
        }
        for (f in futures) {
            f.get()
        }
        @Expect(serverHits.load(), 20)
        c.close()
        server.close()
    }
    @TestCase
    func poolSizeOneSequentialRequestsSucceed(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        })
        let c = ClientBuilder().poolSize(1).readTimeout(5 * Duration.second).build()
        for (_ in 0..5) {
            let resp = c.get("http://127.0.0.1:${server.port}/")
            @Expect(resp.status, 200)
        }
        c.close()
        server.close()
    }
    @TestCase
    func customConnectorInvoked(): Unit {
        connectorCalls.store(0)
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("via-connector") })
        })
        let c = ClientBuilder()
            .connector({ sa: SocketAddress =>
                connectorCalls.fetchAdd(1)
                let socket = TcpSocket(sa)
                socket.connect()
                return socket
            })
            .readTimeout(5 * Duration.second)
            .build()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "via-connector")
        @Expect(connectorCalls.load() >= 1, true)
        c.close()
        server.close()
    }
    @TestCase
    func connectorDialFailurePropagates(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("x") })
        })
        let c = ClientBuilder()
            .connector({ sa: SocketAddress =>
                throw ConnectionException("dial blocked by test")
            })
            .readTimeout(5 * Duration.second)
            .build()
        try {
            let resp = c.get("http://127.0.0.1:${server.port}/")
            @Fail("expected dial failure, got ${resp.status}")
        } catch (e: Exception) {
            @Expect(e.message.size > 0)
        }
        c.close()
        server.close()
    }
    @TestCase
    func httpProxyUnreachableFails(): Unit {
        let dead = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("x") })
        })
        let deadPort = dead.port
        dead.close()

        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("direct") })
        })
        let c = ClientBuilder()
            .httpProxy("http://127.0.0.1:${deadPort}")
            .readTimeout(5 * Duration.second)
            .build()
        try {
            let resp = c.get("http://127.0.0.1:${server.port}/")
            @Fail("expected proxy connection failure, got ${resp.status}")
        } catch (e: Exception) {
            @Expect(e.message.size > 0)
        }
        c.close()
        server.close()
    }
    @TestCase
    func idleConnectionTransparentReconnect(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket)
            .httpKeepAliveTimeout(Duration.millisecond * 300)
            .build()
        server.distributor.register("/", { ctx => ctx.responseBuilder.body("alive") })
        spawn { server.serve() }
        while (server.port == 0) {
            sleep(Duration.millisecond)
        }
        let c = newTransportClient()
        let resp1 = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp1.status, 200)
        sleep(Duration.second * 1)
        let resp2 = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp2.status, 200)
        @Expect(bodyAsString(resp2.body), "alive")
        c.close()
        server.close()
    }
    @TestCase
    func streamingInputStreamBody(): Unit {
        let server = startServer({
            s => s.distributor.register("/", {
                ctx =>
                let body = bodyAsString(ctx.request.body)
                ctx.responseBuilder.body("len=${body.size}")
            })
        })
        let payload = Array<UInt8>(5000, repeat: 0x41)
        let stream = PayloadStream(payload)
        let c = newTransportClient()
        let req = HttpRequestBuilder().method("POST")
            .url("http://127.0.0.1:${server.port}/")
            .body(stream)
            .build()
        let resp = c.send(req)
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "len=5000")
        c.close()
        server.close()
    }
    @TestCase
    func expect100ContinueStillGetsFinalResponse(): Unit {
        let server = startServer({
            s => s.distributor.register("/", {
                ctx =>
                let body = bodyAsString(ctx.request.body)
                ctx.responseBuilder.body("got-${body.size}")
            })
        })
        let c = newTransportClient()
        let req = HttpRequestBuilder().method("POST")
            .url("http://127.0.0.1:${server.port}/")
            .header("Expect", "100-continue")
            .body("payload")
            .build()
        let resp = c.send(req)
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "got-7")
        c.close()
        server.close()
    }
}
