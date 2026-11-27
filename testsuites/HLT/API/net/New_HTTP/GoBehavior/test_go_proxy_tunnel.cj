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
import stdx.encoding.url.*
import std.net.*
import std.io.*
import std.convert.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

var lastProxyLine = "?"
var proxyConnCount = AtomicInt64(0)
var upstreamAddr: ?SocketAddress = None<SocketAddress>

func proxyCert(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}
func drainHeadCaptureLine(sock: TcpSocket): String {
    let buf = Array<UInt8>(8192, repeat: 0)
    var head = ""
    while (true) {
        let n = sock.read(buf)
        if (n <= 0) {
            break
        }
        head = head + String.fromUtf8(buf[0..n])
        if (head.contains("\r\n\r\n")) {
            break
        }
    }
    match (head.lastIndexOf("\r\n")) {
        case Some(i) =>
            var lineEnd = head.lastIndexOf("\r\n")
            let first = head[0..i]
            return first
        case None => return head
    }
}

func startRawProxy(): (TcpServerSocket, Int64) {
    let listener = TcpServerSocket(bindAt: 0)
    listener.bind()
    spawn {
        while (true) {
            try {
                let sock = listener.accept()
                spawn {
                    let seq = proxyConnCount.fetchAdd(1)
                    let line = drainHeadCaptureLine(sock)
                    lastProxyLine = line
                    if (line.startsWith("CONNECT")) {
                        try {
                            sock.write("HTTP/1.1 200 Connection established\r\n\r\n".toArray())
                            match (upstreamAddr) {
                                case Some(ua) =>
                                    let up = TcpSocket(ua)
                                    up.connect()
                                    spawn {
                                        let b1 = Array<UInt8>(8192, repeat: 0)
                                        while (true) {
                                            let n = up.read(b1)
                                            if (n <= 0) { break }
                                            sock.write(b1[0..n])
                                        }
                                        sock.close()
                                    }
                                    let b2 = Array<UInt8>(8192, repeat: 0)
                                    while (true) {
                                        let n = sock.read(b2)
                                        if (n <= 0) { break }
                                        up.write(b2[0..n])
                                    }
                                    up.close()
                                case None => ()
                            }
                        } catch (e: Exception) {
                            ()
                        }
                    } else {
                        while (true) {
                            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 10\r\n\r\nvia-proxy!".toArray())
                            let head = drainHeadCaptureLine(sock)
                            if (head == "") {
                                break
                            }
                        }
                        sock.close()
                    }
                }
            } catch (e: Exception) {
                break
            }
        }
    }
    var port: Int64 = 0
    while (port == 0) {
        sleep(Duration.millisecond)
        let text = listener.localAddress.toString()
        match (text.lastIndexOf(":")) {
            case Some(idx) => port = Int64.parse(text[idx + 1..])
            case None => ()
        }
    }
    return (listener, port)
}

@Test
class GoProxyTunnelTest {
    @TestCase
    func absoluteFormThroughProxy(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("direct") })
        })
        upstreamAddr = Some<SocketAddress>(server.listener.localAddress)
        let (proxy, proxyPort) = startRawProxy()
        let c = ClientBuilder().httpProxy("http://127.0.0.1:${proxyPort}")
            .readTimeout(5 * Duration.second).build()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        @Expect(bodyAsString(resp.body), "via-proxy!")
        @Expect(lastProxyLine.startsWith("GET http://"), true)
        c.close()
        proxy.close()
        server.close()
    }
    @TestCase
    func connectTunnelForHttps(): Unit {
        var scfg = tlsServerConfig(["http/1.1"])
        let upstream = startTlsServer(scfg, {
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("tunnel-ok") })
        })
        upstreamAddr = Some<SocketAddress>(upstream.listener.localAddress)
        let (proxy, proxyPort) = startRawProxy()
        var ccfg = tlsClientConfig(["root_rsa.cer"], ["http/1.1"])
        ccfg.verifyMode = CertificateVerifyMode.TrustAll
        let c = ClientBuilder().httpsProxy("http://127.0.0.1:${proxyPort}")
            .tlsConfig(ccfg)
            .readTimeout(10 * Duration.second)
            .build()
        try {
            let resp = c.get("https://127.0.0.1:${upstream.port}/")
            @Expect(resp.status, 200)
            @Expect(bodyAsString(resp.body), "tunnel-ok")
            @Expect(lastProxyLine.startsWith("CONNECT"), true)
        } catch (e: Exception) {
            @Fail("https via proxy must CONNECT-tunnel: ${e.message}")
        }
        c.close()
        proxy.close()
        upstream.close()
    }
    @TestCase
    func proxyAuthHeaderForwarded(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("direct") })
        })
        upstreamAddr = Some<SocketAddress>(server.listener.localAddress)
        let (proxy, proxyPort) = startRawProxy()
        let c = ClientBuilder().httpProxy("http://127.0.0.1:${proxyPort}")
            .readTimeout(5 * Duration.second).build()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${server.port}/")
            .header("Proxy-Authorization", "Basic dXNlcjpwYXNz").build()
        let resp = c.send(req)
        @Expect(resp.status, 200)
        @Expect(lastProxyLine.contains("GET http://"), true)
        c.close()
        proxy.close()
        server.close()
    }
    @TestCase
    func proxyConnectionNoLeak(): Unit {
        let server = startServer({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        })
        upstreamAddr = Some<SocketAddress>(server.listener.localAddress)
        let (proxy, proxyPort) = startRawProxy()
        proxyConnCount.store(0)
        let c = ClientBuilder().httpProxy("http://127.0.0.1:${proxyPort}")
            .readTimeout(5 * Duration.second).build()
        for (_ in 0..5) {
            let resp = c.get("http://127.0.0.1:${server.port}/")
            @Expect(resp.status, 200)
        }
        println("[leak] proxy conns=${proxyConnCount.load()}")
        @Expect(proxyConnCount.load() <= 2, true)
        c.close()
        proxy.close()
        server.close()
    }
}
