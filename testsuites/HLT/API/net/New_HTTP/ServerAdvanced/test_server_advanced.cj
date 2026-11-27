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
import stdx.crypto.common.*
import stdx.crypto.kit.*
import stdx.encoding.url.*
import std.net.*
import std.io.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func srvCertFile(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func srvTlsCfg(alpn: Array<String>): TlsServerConfig {
    let cert = X509Certificate.decodeFromPem(srvCertFile("end_rsa.cer"))
    let key = GeneralPrivateKey.decodeFromPem(srvCertFile("end_rsa_private_key.pem"))
    var cfg = TlsServerConfig(cert, key)
    cfg.supportedAlpnProtocols = alpn
    return cfg
}

func srvTlsCli(alpn: Array<String>): TlsClientConfig {
    var cfg = TlsClientConfig()
    cfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(srvCertFile("root_rsa.cer")).map({ c => c }))
    cfg.supportedAlpnProtocols = alpn
    return cfg
}

func startTlsSrv(alpn: Array<String>, configure: (Server) -> Unit): Server {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder()
        .listener(serverSocket)
        .tlsConfig(srvTlsCfg(alpn))
        .build()
    configure(server)
    spawn { server.serve() }
    while (server.port == 0) { sleep(Duration.millisecond) }
    return server
}

func startPlainSrv(configure: (Server) -> Unit): Server {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder().listener(serverSocket).build()
    configure(server)
    spawn { server.serve() }
    while (server.port == 0) { sleep(Duration.millisecond) }
    return server
}

var wsCap: Option<WebSocket> = None<WebSocket>

func readOneMsg(ws: WebSocket): (WebSocketFrameType, Array<UInt8>) {
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
class ServerAdvancedTest {

    @TestCase
    func streamingResponseBasic(): Unit {
        let server = startTlsSrv(["http/1.1"], {
            s => s.distributor.register("/", {
                ctx => ctx.responseBuilder.header("Content-Type", "text/plain").body("streamed")
            })
        })
        let ccfg = srvTlsCli(["http/1.1"])
        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(10 * Duration.second).build()
        let resp = c.get("https://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "streamed")
        c.close()
        server.close()
    }

    @TestCase
    func wsSubProtocolMatch(): Unit {
        let server = startTlsSrv(["http/1.1"], {
            s => s.distributor.register("/ws", {
                ctx =>
                let ws = WebSocket.upgradeFromServer(ctx, subProtocols: ArrayList<String>(["chat"]))
                wsCap = Some(ws)
            })
        })
        let ccfg = srvTlsCli(["http/1.1"])
        let client = ClientBuilder().tlsConfig(ccfg).readTimeout(5 * Duration.second).build()
        let (ws, _) = WebSocket.upgradeFromClient(client,
            URL.parse("wss://127.0.0.1:${server.port}/ws"),
            subProtocols: ArrayList<String>(["chat"]))
        @Expect(ws.subProtocol, "chat")
        ws.closeConn()
        wsCap.getOrThrow().closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func wsSubProtocolNoMatch(): Unit {
        let server = startTlsSrv(["http/1.1"], {
            s => s.distributor.register("/ws", {
                ctx =>
                let ws = WebSocket.upgradeFromServer(ctx, subProtocols: ArrayList<String>(["chat"]))
                wsCap = Some(ws)
            })
        })
        let ccfg = srvTlsCli(["http/1.1"])
        let client = ClientBuilder().tlsConfig(ccfg).readTimeout(5 * Duration.second).build()
        let (ws, _) = WebSocket.upgradeFromClient(client,
            URL.parse("wss://127.0.0.1:${server.port}/ws"),
            subProtocols: ArrayList<String>(["video"]))
        @Expect(ws.subProtocol, "")
        ws.closeConn()
        wsCap.getOrThrow().closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func wsOriginMatchAccepted(): Unit {
        let server = startTlsSrv(["http/1.1"], {
            s => s.distributor.register("/ws", {
                ctx =>
                let ws = WebSocket.upgradeFromServer(ctx,
                    origins: ArrayList<String>(["http://127.0.0.1"]))
                wsCap = Some(ws)
            })
        })
        let ccfg = srvTlsCli(["http/1.1"])
        let client = ClientBuilder().tlsConfig(ccfg).readTimeout(5 * Duration.second).build()
        let hs = HttpHeaders()
        hs.add("Origin", "http://127.0.0.1")
        let (ws, _) = WebSocket.upgradeFromClient(client,
            URL.parse("wss://127.0.0.1:${server.port}/ws"), headers: hs)
        @Expect(ws.subProtocol, "")
        ws.closeConn()
        wsCap.getOrThrow().closeConn()
        client.close()
        server.close()
    }

    @TestCase
    func wsOriginWrongRejected(): Unit {
        let server = startTlsSrv(["http/1.1"], {
            s => s.distributor.register("/ws", {
                ctx =>
                let ws = WebSocket.upgradeFromServer(ctx,
                    origins: ArrayList<String>(["http://trusted.example.com"]))
                wsCap = Some(ws)
            })
        })
        let ccfg = srvTlsCli(["http/1.1"])
        let client = ClientBuilder().tlsConfig(ccfg).readTimeout(5 * Duration.second).build()
        let hs = HttpHeaders()
        hs.add("Origin", "http://evil.example.com")
        try {
            let (ws, _) = WebSocket.upgradeFromClient(client,
                URL.parse("wss://127.0.0.1:${server.port}/ws"), headers: hs)
            ws.closeConn()
            @Fail("wrong origin should be rejected")
        } catch (e: WebSocketException) {
            @Expect(e.message.size > 0, true)
        }
        client.close()
        server.close()
    }

    @TestCase
    func servicePoolConfigStarts(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket)
            .servicePoolConfig(ServicePoolConfig(capacity: 2, queueCapacity: 4))
            .build()
        server.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        c.close()
        server.close()
    }

    @TestCase
    func serverEnableConnectProtocol(): Unit {
        let serverSocket = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket)
            .enableConnectProtocol(true)
            .build()
        server.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }

        let sock = TcpSocket(IPSocketAddress("127.0.0.1", server.port))
        sock.connect()
        sock.write("CONNECT 127.0.0.1:9999 HTTP/1.1\r\nHost: 127.0.0.1:9999\r\n\r\n".toArray())
        let buf = Array<UInt8>(4096, repeat: 0)
        var head = ""
        while (true) {
            let n = sock.read(buf)
            if (n <= 0) { break }
            head = head + String.fromUtf8(buf[0..n])
            if (head.contains("\r\n\r\n")) { break }
        }
        @Expect(head.contains("HTTP/1.1"), true)
        sock.close()
        server.close()
    }

    @TestCase
    func wsOverH2Upgrade(): Unit {
        let serverSocket2 = TcpServerSocket(bindAt: 0)
        let server = ServerBuilder()
            .listener(serverSocket2)
            .tlsConfig(srvTlsCfg(["h2"]))
            .enableConnectProtocol(true)
            .build()
        server.distributor.register("/ws", {
            ctx => wsCap = Some(WebSocket.upgradeFromServer(ctx))
        })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }

        let ccfg = srvTlsCli(["h2"])
        let client = ClientBuilder().tlsConfig(ccfg).readTimeout(10 * Duration.second).build()
        try {
            let (ws, _) = WebSocket.upgradeFromClient(client,
                URL.parse("wss://127.0.0.1:${server.port}/ws"),
                version: HTTP2_0)
            ws.write(TextWebFrame, "h2-ws".toArray(), frameSize: 4096)
            let (op, pl) = readOneMsg(wsCap.getOrThrow())
            @Expect(op, TextWebFrame)
            ws.closeConn()
            wsCap.getOrThrow().closeConn()
        } catch (e: Exception) {
            @Fail("WS over H2 should work: ${e.message}")
        }
        client.close()
        server.close()
    }

    @TestCase
    func concurrentClientsEachGetResponse(): Unit {
        let server = startPlainSrv({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("cc") })
        })
        let c1 = ClientBuilder().readTimeout(5 * Duration.second).build()
        let c2 = ClientBuilder().readTimeout(5 * Duration.second).build()
        let c3 = ClientBuilder().readTimeout(5 * Duration.second).build()
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
    func handlerExceptionDoesNotCrashServer(): Unit {
        let server = startPlainSrv({
            s =>
            s.distributor.register("/boom", { ctx => throw HttpException("handler boom") })
            s.distributor.register("/alive", { ctx => ctx.responseBuilder.body("alive") })
        })
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        try {
            let resp = c.get("http://127.0.0.1:${server.port}/boom")
            @Expect(resp.status >= 400, true)
        } catch (e: Exception) {
            @Expect(e.message.size > 0, true)
        }
        let resp2 = c.get("http://127.0.0.1:${server.port}/alive")
        @Expect(resp2.status, 200)
        c.close()
        server.close()
    }

    @TestCase
    func serverKeepAliveBetweenRequests(): Unit {
        let server = startPlainSrv({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("ka") })
        })
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        for (_ in 0..3) {
            let resp = c.get("http://127.0.0.1:${server.port}/")
            @Expect(resp.status, 200)
        }
        c.close()
        server.close()
    }
}
