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

func pt8(v: Int64): UInt8 { return UInt8(v & 0xFF) }

func ptPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func ptStartTlsServer(certFile: String, keyFile: String): (TcpServerSocket, Int64) {
    let listener = TcpServerSocket(bindAt: 0)
    listener.bind()
    var port: Int64 = 0
    while (port == 0) {
        sleep(Duration.millisecond)
        let t = listener.localAddress.toString()
        match (t.lastIndexOf(":")) {
            case Some(i) => port = Int64.parse(t[i + 1..])
            case None => ()
        }
    }
    spawn {
        try {
            let tcp = listener.accept()
            var cfg = TlsServerConfig(X509Certificate.decodeFromPem(ptPem(certFile)),
                GeneralPrivateKey.decodeFromPem(ptPem(keyFile)))
            let ts = TlsSocket.server(tcp, serverConfig: cfg)
            let r = ts.handshake()
            let resp = "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nok"
            ts.write(resp.toArray())
            ts.flush()
            sleep(Duration.millisecond * 300)
            try { ts.close() } catch (e: Exception) { () }
        } catch (e: Exception) { () }
    }
    return (listener, port)
}

func ptTlsClient(port: Int64, host: String, ccfg: TlsClientConfig): (Bool, String) {
    try {
        let tcp = TcpSocket(host, UInt16(port))
        tcp.connect()
        let ts = TlsSocket.client(tcp, clientConfig: ccfg)
        let r = ts.handshake()
        try { ts.close() } catch (e: Exception) { () }
        return (true, "OK ver=${r.version}")
    } catch (e: Exception) {
        return (false, "EXC: ${e}")
    }
}

@Test
class HuntProxyTlsEdge {
    @TestCase
    func tc1ExpiredCertRejected(): Unit {
        let (listener, port) = ptStartTlsServer("expired.cer", "expired_key.pem")
        let (ok, detail) = ptTlsClient(port, "127.0.0.1", TlsClientConfig())
        listener.close()
        println("[TC1-expired] ok=${ok} detail=${detail}")
        @Expect(ok, false)
    }

    @TestCase
    func tc2ValidCertTrustAll(): Unit {
        let (listener, port) = ptStartTlsServer("end_rsa.cer", "end_rsa_private_key.pem")
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        let (ok, detail) = ptTlsClient(port, "127.0.0.1", ccfg)
        listener.close()
        println("[TC2-trustall] ok=${ok} detail=${detail}")
        @Expect(ok, true)
    }

    @TestCase
    func tc3ValidCertCustomCA(): Unit {
        let (listener, port) = ptStartTlsServer("end_rsa.cer", "end_rsa_private_key.pem")
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(ptPem("root_rsa.cer")).map({c => c}))
        let tcp = TcpSocket("127.0.0.1", UInt16(port))
        tcp.connect()
        let ts = TlsSocket.client(tcp, clientConfig: ccfg)
        let r = ts.handshake()
        let detail = "OK ver=${r.version}"
        try { ts.close() } catch (e: Exception) { () }
        listener.close()
        println("[TC3-customca] ${detail}")
        @Expect(detail.startsWith("OK"), true)
    }

    @TestCase
    func px1ConnectTunnel(): Unit {
        var cfg = TlsServerConfig(X509Certificate.decodeFromPem(ptPem("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(ptPem("end_rsa_private_key.pem")))
        cfg.supportedAlpnProtocols = ["h2"]
        let target = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        target.distributor.register("/", { ctx => ctx.responseBuilder.body("tls-via-proxy") })
        spawn { target.serve() }
        while (target.port == 0) { sleep(Duration.millisecond) }
        let tport = Int64(target.port)

        let proxyListener = TcpServerSocket(bindAt: 0)
        proxyListener.bind()
        var pport: Int64 = 0
        while (pport == 0) {
            sleep(Duration.millisecond)
            let t = proxyListener.localAddress.toString()
            match (t.lastIndexOf(":")) {
                case Some(i) => pport = Int64.parse(t[i + 1..])
                case None => ()
            }
        }
        spawn {
            while (true) {
                try {
                    let client = proxyListener.accept()
                    spawn {
                        try {
                            let buf = Array<UInt8>(4096, repeat: 0)
                            var head = ""
                            while (!head.contains("\r\n\r\n")) {
                                var n = 0
                                var err = false
                                try { n = client.read(buf) } catch (e: Exception) { err = true }
                                if (err || n <= 0) { return }
                                head = head + String.fromUtf8(buf[0..n])
                            }
                            if (head.startsWith("CONNECT")) {
                                client.write("HTTP/1.1 200 Connection established\r\n\r\n".toArray())
                                let upstream = TcpSocket("127.0.0.1", UInt16(tport))
                                upstream.connect()
                                spawn {
                                    let b2 = Array<UInt8>(8192, repeat: 0)
                                    while (true) {
                                        var n = 0
                                        var err = false
                                        try { n = upstream.read(b2) } catch (e: Exception) { err = true }
                                        if (err || n <= 0) { break }
                                        client.write(b2[0..n])
                                    }
                                }
                                let b1 = Array<UInt8>(8192, repeat: 0)
                                while (true) {
                                    var n = 0
                                    var err = false
                                    try { n = client.read(b1) } catch (e: Exception) { err = true }
                                    if (err || n <= 0) { break }
                                    upstream.write(b1[0..n])
                                }
                                upstream.close()
                            } else {
                                client.write("HTTP/1.1 405 Method Not Allowed\r\nContent-Length: 0\r\n\r\n".toArray())
                            }
                            try { client.close() } catch (e: Exception) { () }
                        } catch (e: Exception) { () }
                    }
                } catch (e: Exception) { return }
            }
        }
        sleep(Duration.millisecond * 100)

        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        let c = ClientBuilder().tlsConfig(ccfg)
            .httpsProxy("http://127.0.0.1:${pport}")
            .readTimeout(10 * Duration.second).build()
        var body = "?"
        try {
            let r = c.get("https://127.0.0.1:${tport}/")
            let buffer = ArrayList<UInt8>()
            let chunk = Array<UInt8>(8192, repeat: 0)
            while (true) {
                let n = r.body.read(chunk)
                if (n <= 0) { break }
                for (i in 0..n) { buffer.add(chunk[i]) }
            }
            body = String.fromUtf8(buffer.toArray())
        } catch (e: Exception) {
            body = "EXC: ${e}"
        }
        c.close()
        target.close()
        proxyListener.close()
        println("[PX1-CONNECT] body=[${body}]")
        @Expect(body, "tls-via-proxy")
    }

    @TestCase
    func px2ProxyForward(): Unit {
        var cfg = TlsServerConfig(X509Certificate.decodeFromPem(ptPem("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(ptPem("end_rsa_private_key.pem")))
        cfg.supportedAlpnProtocols = ["h2"]
        let target = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        target.distributor.register("/", { ctx => ctx.responseBuilder.body("proxy-target") })
        spawn { target.serve() }
        while (target.port == 0) { sleep(Duration.millisecond) }
        let tport = Int64(target.port)

        let proxyListener = TcpServerSocket(bindAt: 0)
        proxyListener.bind()
        var pport: Int64 = 0
        while (pport == 0) {
            sleep(Duration.millisecond)
            let t = proxyListener.localAddress.toString()
            match (t.lastIndexOf(":")) {
                case Some(i) => pport = Int64.parse(t[i + 1..])
                case None => ()
            }
        }
        spawn {
            while (true) {
                try {
                    let client = proxyListener.accept()
                    spawn {
                        try {
                            let buf = Array<UInt8>(8192, repeat: 0)
                            var head = ""
                            while (!head.contains("\r\n\r\n")) {
                                var n = 0
                                var err = false
                                try { n = client.read(buf) } catch (e: Exception) { err = true }
                                if (err || n <= 0) { return }
                                head = head + String.fromUtf8(buf[0..n])
                            }
                            client.write("HTTP/1.1 200 OK\r\nContent-Length: 12\r\n\r\nproxy-forward".toArray())
                            try { client.close() } catch (e: Exception) { () }
                        } catch (e: Exception) { () }
                    }
                } catch (e: Exception) { return }
            }
        }
        sleep(Duration.millisecond * 100)

        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        let c = ClientBuilder().tlsConfig(ccfg)
            .httpProxy("http://127.0.0.1:${pport}")
            .readTimeout(10 * Duration.second).build()
        var result = "?"
        try {
            let r = c.get("https://127.0.0.1:${tport}/")
            let buffer = ArrayList<UInt8>()
            let chunk = Array<UInt8>(8192, repeat: 0)
            while (true) {
                let n = r.body.read(chunk)
                if (n <= 0) { break }
                for (i in 0..n) { buffer.add(chunk[i]) }
            }
            result = String.fromUtf8(buffer.toArray())
        } catch (e: Exception) {
            result = "EXC: ${e}"
        }
        c.close()
        proxyListener.close()
        target.close()
        println("[PX2-FORWARD] result=${result}")
        @Expect(result, "proxy-target")
    }

    @TestCase
    func px3Proxy407NoneValue(): Unit {
        let proxyListener = TcpServerSocket(bindAt: 0)
        proxyListener.bind()
        var pport: Int64 = 0
        while (pport == 0) {
            sleep(Duration.millisecond)
            let t = proxyListener.localAddress.toString()
            match (t.lastIndexOf(":")) {
                case Some(i) => pport = Int64.parse(t[i + 1..])
                case None => ()
            }
        }
        spawn {
            while (true) {
                try {
                    let client = proxyListener.accept()
                    spawn {
                        try {
                            let buf = Array<UInt8>(8192, repeat: 0)
                            var head = ""
                            while (!head.contains("\r\n\r\n")) {
                                var n = 0
                                var err = false
                                try { n = client.read(buf) } catch (e: Exception) { err = true }
                                if (err || n <= 0) { return }
                                head = head + String.fromUtf8(buf[0..n])
                            }
                            if (head.contains("Proxy-Authorization")) {
                                client.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nok".toArray())
                            } else {
                                client.write("HTTP/1.1 407 Proxy Authentication Required\r\nProxy-Authenticate: Basic realm=test\r\nContent-Length: 0\r\n\r\n".toArray())
                            }
                            try { client.close() } catch (e: Exception) { () }
                        } catch (e: Exception) { () }
                    }
                } catch (e: Exception) { return }
            }
        }
        sleep(Duration.millisecond * 100)

        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        let c = ClientBuilder().tlsConfig(ccfg)
            .httpsProxy("http://127.0.0.1:${pport}")
            .readTimeout(5 * Duration.second).build()
        var outcome = "?"
        try {
            let r = c.get("https://127.0.0.1:1/")
            outcome = "status=${r.status}"
        } catch (e: Exception) {
            outcome = "EXC: ${e}"
        }
        c.close()
        proxyListener.close()
        println("[PX3-407] outcome=${outcome}")
        @Expect(outcome.contains("407") || outcome.contains("NoneValue"), true)
    }
}
