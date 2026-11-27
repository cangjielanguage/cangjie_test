/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.net.http.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.crypto.kit.*
import stdx.crypto.common.*
import stdx.encoding.url.*
import std.net.*
import std.io.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func g10Cert(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func g10SrvTls(alpn: Array<String>): TlsServerConfig {
    let cert = X509Certificate.decodeFromPem(g10Cert("end_rsa.cer"))
    let key = GeneralPrivateKey.decodeFromPem(g10Cert("end_rsa_private_key.pem"))
    var cfg = TlsServerConfig(cert, key)
    cfg.supportedAlpnProtocols = alpn
    return cfg
}

func g10CliTls(alpn: Array<String>): TlsClientConfig {
    var cfg = TlsClientConfig()
    cfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(g10Cert("root_rsa.cer")).map({ c => c }))
    cfg.supportedAlpnProtocols = alpn
    return cfg
}

func g10PlainSrv(configure: (Server) -> Unit): Server {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder().listener(serverSocket).build()
    configure(server)
    spawn { server.serve() }
    while (server.port == 0) { sleep(Duration.millisecond) }
    return server
}

func g10TlsSrv(alpn: Array<String>, configure: (Server) -> Unit): Server {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder()
        .listener(serverSocket)
        .tlsConfig(g10SrvTls(alpn))
        .build()
    configure(server)
    spawn { server.serve() }
    while (server.port == 0) { sleep(Duration.millisecond) }
    return server
}

var g10HitCount = AtomicInt64(0)
var g10WsCap: Option<WebSocket> = None<WebSocket>

func g10ReadMsg(ws: WebSocket): (WebSocketFrameType, Array<UInt8>) {
    let data = ArrayList<UInt8>()
    var ftype: WebSocketFrameType = TextWebFrame
    while (true) {
        let frame = ws.read()
        if (frame.frameType != ContinuationWebFrame) { ftype = frame.frameType }
        for (b in frame.payload) { data.add(b) }
        if (frame.fin) { break }
    }
    return (ftype, data.toArray())
}

@Test
class G10Test {

    @TestCase
    func tenSequentialRequestsSameClient(): Unit {
        g10HitCount.store(0)
        let server = g10PlainSrv({
            s =>
            s.distributor.register("/", {
                ctx =>
                g10HitCount.fetchAdd(1)
                ctx.responseBuilder.body("resp-${g10HitCount.load()}")
            })
        })
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        for (_ in 0..10) {
            let resp = c.get("http://127.0.0.1:${server.port}/")
            @Expect(resp.status, 200)
        }
        @Expect(g10HitCount.load(), 10)
        c.close()
        server.close()
    }

    @TestCase
    func largeBodyPostNoDeadlock(): Unit {
        let server = g10PlainSrv({
            s => s.distributor.register("/", {
                ctx =>
                let body = Array<UInt8>(4096, repeat: 0)
                var total = 0
                while (true) {
                    let n = ctx.request.body.read(body)
                    if (n <= 0) { break }
                    total += n
                }
                ctx.responseBuilder.body("len=${total}")
            })
        })
        let c = ClientBuilder().readTimeout(10 * Duration.second).build()
        let req = HttpRequestBuilder().method("POST")
            .url("http://127.0.0.1:${server.port}/")
            .body(Array<UInt8>(100000, repeat: 0x42))
            .build()
        let resp = c.send(req)
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "len=100000")
        c.close()
        server.close()
    }

    @TestCase
    func concurrentRequestsOnSameClient(): Unit {
        g10HitCount.store(0)
        let server = g10PlainSrv({
            s =>
            s.distributor.register("/", {
                ctx =>
                g10HitCount.fetchAdd(1)
                ctx.responseBuilder.body("ok")
            })
        })
        let c = ClientBuilder().readTimeout(10 * Duration.second).build()
        let futures = ArrayList<Future<Unit>>()
        for (_ in 0..5) {
            futures.add(spawn {
                let resp = c.get("http://127.0.0.1:${server.port}/")
                @Expect(resp.status, 200)
            })
        }
        for (f in futures) { f.get() }
        @Expect(g10HitCount.load(), 5)
        c.close()
        server.close()
    }

    @TestCase
    func wsOverH2DataExchange(): Unit {
        let server = g10TlsSrv(["h2"], {
            s =>
            s.distributor.register("/ws", {
                ctx => g10WsCap = Some(WebSocket.upgradeFromServer(ctx))
            })
        })
        let ccfg = g10CliTls(["h2"])
        let client = ClientBuilder().tlsConfig(ccfg).enablePush(true)
            .readTimeout(10 * Duration.second).build()
        try {
            let (ws, _) = WebSocket.upgradeFromClient(client,
                URL.parse("wss://127.0.0.1:${server.port}/ws"),
                version: HTTP2_0)
            ws.write(TextWebFrame, "h2-ws-echo".toArray(), frameSize: 4096)
            let (t, tp) = g10ReadMsg(g10WsCap.getOrThrow())
            @Expect(t, TextWebFrame)
            @Expect(tp, "h2-ws-echo".toArray())
            ws.write(BinaryWebFrame, [0x01u8, 0x02u8, 0x03u8], frameSize: 4096)
            let (bt, bp) = g10ReadMsg(ws)
            @Expect(bt, BinaryWebFrame)
            @Expect(bp, [0x01u8, 0x02u8, 0x03u8])
            ws.closeConn()
            g10WsCap.getOrThrow().closeConn()
        } catch (e: Exception) {
            @Fail("WS over H2: ${e.message}")
        }
        client.close()
        server.close()
    }

    @TestCase
    func wsOverH2MultipleMessages(): Unit {
        let server = g10TlsSrv(["h2"], {
            s =>
            s.distributor.register("/ws", {
                ctx => g10WsCap = Some(WebSocket.upgradeFromServer(ctx))
            })
        })
        let ccfg = g10CliTls(["h2"])
        let client = ClientBuilder().tlsConfig(ccfg).enablePush(true)
            .readTimeout(10 * Duration.second).build()
        try {
            let (ws, _) = WebSocket.upgradeFromClient(client,
                URL.parse("wss://127.0.0.1:${server.port}/ws"),
                version: HTTP2_0)
            for (i in 1..3) {
                ws.write(TextWebFrame, "msg-${i}".toArray(), frameSize: 4096)
                let (_, pl) = g10ReadMsg(ws)
                @Expect(pl, "msg-${i}".toArray())
            }
            ws.closeConn()
            g10WsCap.getOrThrow().closeConn()
        } catch (e: Exception) {
            @Fail("WS over H2 multiple messages: ${e.message}")
        }
        client.close()
        server.close()
    }
}
