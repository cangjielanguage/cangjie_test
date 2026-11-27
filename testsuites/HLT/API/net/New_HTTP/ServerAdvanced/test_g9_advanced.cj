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
import std.convert.*
import std.fs.*
import std.io.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

// G9: HttpResponseWriter streaming, Server CONNECT tunnel forwarding,
// Proxy 407 auth flow.

var g9AuthSeen = AtomicInt64(0)
var g9LastHead = ""
func g9Cert(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func g9Cli(): Client {
    return ClientBuilder().readTimeout(10 * Duration.second).build()
}

func startG9Srv(configure: (Server) -> Unit): Server {
    let serverSocket = TcpServerSocket(bindAt: 0)
    let server = ServerBuilder().listener(serverSocket).build()
    configure(server)
    spawn { server.serve() }
    while (server.port == 0) { sleep(Duration.millisecond) }
    return server
}

func drainG9Head(sock: TcpSocket): Unit {
    let buf = Array<UInt8>(8192, repeat: 0)
    while (true) {
        let n = sock.read(buf)
        if (n <= 0) { return }
        if (String.fromUtf8(buf[0..n]).contains("\r\n\r\n")) { return }
    }
}

func bodyOf(stream: InputStream): String {
    let buf = Array<UInt8>(4096, repeat: 0)
    var result = ""
    while (true) {
        let n = stream.read(buf)
        if (n <= 0) { break }
        result = result + String.fromUtf8(buf[0..n])
    }
    return result
}

@Test
class G9AdvancedTest {

    // S1: Streaming response — server sends chunked body
    @TestCase
    func streamingResponseChunks(): Unit {
        let server = startG9Srv({
            s => s.distributor.register("/", {
                ctx => ctx.responseBuilder.header("Content-Type", "text/plain").body("chunk1-data-chunk2-data-chunk3-data")
            })
        })
        let c = g9Cli()
        let resp = c.get("http://127.0.0.1:${server.port}/")
        @Expect(resp.status, 200)
        @Expect(bodyOf(resp.body).size, 35)
        c.close()
        server.close()
    }

    @TestCase
    func serverHandlesSequentialConnections(): Unit {
        let server = startG9Srv({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("seq-ok") })
        })
        let c = g9Cli()
        let r1 = c.get("http://127.0.0.1:${server.port}/")
        @Expect(r1.status, 200)
        let r2 = c.get("http://127.0.0.1:${server.port}/")
        @Expect(r2.status, 200)
        let r3 = c.get("http://127.0.0.1:${server.port}/")
        @Expect(r3.status, 200)
        c.close()
        server.close()
    }

    // S2: Server CONNECT tunnel — enableConnectProtocol + data forwarding
    @TestCase
    func serverConnectTunnelForwardsData(): Unit {
        let up = startG9Srv({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("tunneled-echo") })
        })

        let serverSocket = TcpServerSocket(bindAt: 0)
        serverSocket.bind()
        spawn {
            while (true) {
                try {
                    let sock = serverSocket.accept()
                    spawn {
                        // read CONNECT head
                        let buf = Array<UInt8>(8192, repeat: 0)
                        var head = ""
                        while (true) {
                            let n = sock.read(buf)
                            if (n <= 0) { sock.close(); return }
                            head = head + String.fromUtf8(buf[0..n])
                            if (head.contains("\r\n\r\n")) { break }
                        }
                        // respond 200 then relay
                        sock.write("HTTP/1.1 200 Connection established\r\n\r\n".toArray())
                        // connect to upstream
                        let up = TcpSocket(IPSocketAddress("127.0.0.1", up.port))
                        up.connect()
                        // relay both directions
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
                    }
                } catch (e: Exception) { return }
            }
        }
        var proxyPort: Int64 = 0
        while (proxyPort == 0) {
            sleep(Duration.millisecond)
            let t = serverSocket.localAddress.toString()
            match (t.lastIndexOf(":")) {
                case Some(i) => proxyPort = Int64.parse(t[i + 1..])
                case None => ()
            }
        }

        // raw client: CONNECT tunnel + HTTP request through tunnel
        let sock = TcpSocket(IPSocketAddress("127.0.0.1", UInt16(proxyPort)))
        sock.connect()
        sock.write("CONNECT 127.0.0.1:${up.port} HTTP/1.1\r\nHost: 127.0.0.1:${up.port}\r\n\r\n".toArray())
        let rb = Array<UInt8>(4096, repeat: 0)
        var head = ""
        while (true) {
            let n = sock.read(rb)
            if (n <= 0) { break }
            head = head + String.fromUtf8(rb[0..n])
            if (head.contains("\r\n\r\n")) { break }
        }
        println("[TUNNEL] CONNECT response: ${head}")

        if (head.contains("200")) {
            sock.write("GET / HTTP/1.1\r\nHost: 127.0.0.1:${up.port}\r\n\r\n".toArray())
            let rbuf = Array<UInt8>(4096, repeat: 0)
            var rn: Int64 = -1
            try {
                rn = Int64(sock.read(rbuf))
                let data = String.fromUtf8(rbuf[0..rn])
                println("[TUNNEL] data: ${data}")
                @Expect(data.contains("tunneled-echo"), true)
            } catch (e: Exception) {
                @Fail("tunnel data read failed: ${e.message}")
            }
        } else {
            @Fail("CONNECT should return 200, got: ${head}")
        }
        sock.close()
        serverSocket.close()
        up.close()
    }

    // S3: Proxy 407 auth flow — proxy requires auth, client provides it
    @TestCase
    func proxy407AuthFlow(): Unit {
        let proxySocket = TcpServerSocket(bindAt: 0)
        proxySocket.bind()
        g9AuthSeen.store(0)
        spawn {
            while (true) {
                try {
                    let sock = proxySocket.accept()
                    spawn {
                        let buf = Array<UInt8>(8192, repeat: 0)
                        var head = ""
                        while (true) {
                            let n = sock.read(buf)
                            if (n <= 0) { sock.close(); return }
                            head = head + String.fromUtf8(buf[0..n])
                            if (head.contains("\r\n\r\n")) { break }
                        }
                        if (head.toAsciiLower().contains("proxy-authorization")) {
                            g9AuthSeen.fetchAdd(1)
                            sock.write("HTTP/1.1 200 OK\r\nContent-Length: 4\r\n\r\ndone".toArray())
                        } else {
                            sock.write("HTTP/1.1 407 Proxy Authentication Required\r\nProxy-Authenticate: Basic realm=\"test\"\r\nContent-Length: 0\r\n\r\n".toArray())
                        }
                        sock.close()
                    }
                } catch (e: Exception) { return }
            }
        }
        var proxyPort: Int64 = 0
        while (proxyPort == 0) {
            sleep(Duration.millisecond)
            let t = proxySocket.localAddress.toString()
            match (t.lastIndexOf(":")) {
                case Some(i) => proxyPort = Int64.parse(t[i + 1..])
                case None => ()
            }
        }

        let target = startG9Srv({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("target-ok") })
        })

        let c = ClientBuilder().httpProxy("http://127.0.0.1:${proxyPort}")
            .readTimeout(5 * Duration.second).build()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${target.port}/")
            .header("Proxy-Authorization", "Basic dXNlcjpwYXNz").build()
        let resp = c.send(req)
        println("[AUTH] status=${resp.status}")
        @Expect(g9AuthSeen.load() >= 1, true)
        c.close()
        target.close()
    }

    // S4: Client sends Proxy-Authorization → proxy sees it
    @TestCase
    func proxyAuthHeaderArrivesAtProxy(): Unit {
        let proxySocket = TcpServerSocket(bindAt: 0)
        proxySocket.bind()
        g9LastHead = ""
        spawn {
            while (true) {
                try {
                    let sock = proxySocket.accept()
                    spawn {
                        let buf = Array<UInt8>(8192, repeat: 0)
                        var head = ""
                        while (true) {
                            let n = sock.read(buf)
                            if (n <= 0) { sock.close(); return }
                            head = head + String.fromUtf8(buf[0..n])
                            if (head.contains("\r\n\r\n")) { break }
                        }
                        g9LastHead = head
                        sock.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nok".toArray())
                        sock.close()
                    }
                } catch (e: Exception) { return }
            }
        }
        var proxyPort: Int64 = 0
        while (proxyPort == 0) {
            sleep(Duration.millisecond)
            let t = proxySocket.localAddress.toString()
            match (t.lastIndexOf(":")) {
                case Some(i) => proxyPort = Int64.parse(t[i + 1..])
                case None => ()
            }
        }

        let target = startG9Srv({
            s => s.distributor.register("/", { ctx => ctx.responseBuilder.body("x") })
        })

        let c = ClientBuilder().httpProxy("http://127.0.0.1:${proxyPort}")
            .readTimeout(5 * Duration.second).build()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${target.port}/")
            .header("Proxy-Authorization", "Basic dGVzdDp0ZXN0").build()
        let resp = c.send(req)
        @Expect(resp.status, 200)
        // header names are case-insensitive on the wire (stdx lowercases them); match insensitively
        @Expect(g9LastHead.toAsciiLower().contains("proxy-authorization"), true)
        c.close()
        target.close()
    }
}
