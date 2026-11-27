/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt --parallel=false

import stdx.net.http.*
import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import std.net.*
import std.io.*
import std.convert.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

var hpaCaptured = ArrayList<String>()
var hpaMode407 = false

func hpaDrainHead(sock: TcpSocket): String {
    let buf = Array<UInt8>(8192, repeat: 0)
    var head = ""
    while (true) {
        let n = sock.read(buf)
        if (n <= 0) { break }
        head = head + String.fromUtf8(buf[0..n])
        if (head.contains("\r\n\r\n")) { break }
    }
    return head
}

func hpaPortOf(listener: TcpServerSocket): Int64 {
    var port: Int64 = 0
    while (port == 0) {
        sleep(Duration.millisecond)
        let t = listener.localAddress.toString()
        match (t.lastIndexOf(":")) {
            case Some(i) => port = Int64.parse(t[i + 1..])
            case None => ()
        }
    }
    return port
}

func hpaStartProxy(): (TcpServerSocket, Int64) {
    let listener = TcpServerSocket(bindAt: 0)
    listener.bind()
    spawn {
        while (true) {
            try {
                let sock = listener.accept()
                spawn {
                    let head = hpaDrainHead(sock)
                    hpaCaptured.add(head)
                    if (hpaMode407) {
                        sock.write("HTTP/1.1 407 Proxy Authentication Required\r\nProxy-Authenticate: Basic realm=\"hlt\"\r\nContent-Length: 0\r\n\r\n".toArray())
                        sock.close()
                        return
                    }
                    if (head.startsWith("CONNECT")) {
                        var tport: UInt16 = 0
                        let firstLine = head[0..(head.indexOf("\r\n") ?? head.size)]
                        let parts = firstLine.split(" ")
                        if (parts.size >= 2) {
                            let hp = parts[1]
                            match (hp.lastIndexOf(":")) {
                                case Some(i) =>
                                    try { tport = UInt16.parse(hp[i + 1..]) } catch (e: Exception) { () }
                                case None => ()
                            }
                        }
                        sock.write("HTTP/1.1 200 Connection established\r\n\r\n".toArray())
                        if (tport != 0) {
                            let up = TcpSocket("127.0.0.1", tport)
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
                        } else {
                            sock.close()
                        }
                    } else {
                        sock.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nok".toArray())
                        sock.close()
                    }
                }
            } catch (e: Exception) { return }
        }
    }
    let port = hpaPortOf(listener)
    return (listener, port)
}

func hpaStartSrv(tls: Bool): Server {
    var builder = ServerBuilder().addr("127.0.0.1").port(0)
    if (tls) {
        let pem = String.fromUtf8(readToEnd(File("data/end_rsa.cer", Read)))
        let key = String.fromUtf8(readToEnd(File("data/end_rsa_private_key.pem", Read)))
        var cfg = TlsServerConfig(X509Certificate.decodeFromPem(pem), GeneralPrivateKey.decodeFromPem(key))
        cfg.supportedAlpnProtocols = ["http/1.1"]
        builder = builder.tlsConfig(cfg)
    }
    let s = builder.build()
    s.distributor.register("/", { ctx => ctx.responseBuilder.body("target-ok") })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func hpaHasAuth(head: String): Bool {
    return head.toAsciiLower().contains("proxy-authorization")
}

@Test
class HuntProxyAuth {
    @TestCase
    func plainProxyForwardsProxyAuth(): Unit {
        hpaCaptured.clear()
        hpaMode407 = false
        let (proxy, pport) = hpaStartProxy()
        let target = hpaStartSrv(false)
        let c = ClientBuilder().httpProxy("http://127.0.0.1:${pport}")
            .readTimeout(5 * Duration.second).build()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${target.port}/")
            .header("Proxy-Authorization", "Basic dXNlcjpwYXNz").build()
        let resp = c.send(req)
        @Expect(resp.status, 200)
        @Expect(hpaCaptured.size >= 1, true)
        @Expect(hpaHasAuth(hpaCaptured[0]), true)
        c.close(); target.close(); proxy.close()
    }

    @TestCase
    func connectTunnelForwardsProxyAuth(): Unit {
        hpaCaptured.clear()
        hpaMode407 = false
        let (proxy, pport) = hpaStartProxy()
        let target = hpaStartSrv(true)
        var cCfg = TlsClientConfig()
        cCfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(
            String.fromUtf8(readToEnd(File("data/root_rsa.cer", Read)))).map({c => c}))
        let c = ClientBuilder().httpsProxy("http://127.0.0.1:${pport}")
            .tlsConfig(cCfg).readTimeout(5 * Duration.second).build()
        let req = HttpRequestBuilder().url("https://127.0.0.1:${target.port}/")
            .header("Proxy-Authorization", "Basic dXNlcjpwYXNz").build()
        let resp = c.send(req)
        @Expect(resp.status, 200)
        @Expect(hpaCaptured.size >= 1, true)
        @Expect(hpaHasAuth(hpaCaptured[0]), true)
        c.close(); target.close(); proxy.close()
    }

    @TestCase
    func proxy407PassedThroughToCaller(): Unit {
        hpaCaptured.clear()
        hpaMode407 = true
        let (proxy, pport) = hpaStartProxy()
        let target = hpaStartSrv(false)
        let c = ClientBuilder().httpProxy("http://127.0.0.1:${pport}")
            .readTimeout(5 * Duration.second).build()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${target.port}/")
            .header("Proxy-Authorization", "Basic dXNlcjpwYXNz").build()
        let resp = c.send(req)
        @Expect(resp.status, 407)
        @Expect(hpaCaptured.size == 1, true)
        c.close(); target.close(); proxy.close()
    }

    @TestCase
    func httpsProxySchemeMustBeHttp(): Unit {
        let e = @AssertThrows[IllegalArgumentException](ClientBuilder().httpsProxy("https://127.0.0.1:18888").build())
        @Expect(e.message.contains("http"), true)
    }

    @TestCase
    func crossSchemeProxyMustBeHonored(): Unit {
        hpaCaptured.clear()
        hpaMode407 = false
        let (proxy, _) = hpaStartProxy()
        let target = hpaStartSrv(true)
        var cCfg = TlsClientConfig()
        cCfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(
            String.fromUtf8(readToEnd(File("data/root_rsa.cer", Read)))).map({c => c}))
        let c = ClientBuilder().httpProxy("http://127.0.0.1:1")
            .tlsConfig(cCfg).readTimeout(3 * Duration.second).build()
        var honored = false
        try {
            let resp = c.get("https://127.0.0.1:${target.port}/")
            println("[hunt-proxy] cross-scheme request SUCCEEDED via direct connection, status=${resp.status}")
        } catch (e: Exception) {
            honored = true
            println("[hunt-proxy] cross-scheme request failed as expected: ${e}")
        }
        @Expect(honored, true)
        c.close(); target.close(); proxy.close()
    }
}
