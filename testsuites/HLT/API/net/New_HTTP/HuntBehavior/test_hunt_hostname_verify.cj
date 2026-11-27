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

func hvPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func hvStartServer(certFile: String, keyFile: String): (TcpServerSocket, Int64) {
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
            var cfg = TlsServerConfig(X509Certificate.decodeFromPem(hvPem(certFile)),
                GeneralPrivateKey.decodeFromPem(hvPem(keyFile)))
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

func hvClientHandshake(port: Int64, host: String): String {
    try {
        let tcp = TcpSocket(host, UInt16(port))
        tcp.connect()
        var ccfg = TlsClientConfig()
        let rootPem = X509Certificate.decodeFromPem(hvPem("root_rsa.cer"))
        ccfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(hvPem("root_rsa.cer")).map({c => c}))
        let ts = TlsSocket.client(tcp, clientConfig: ccfg)
        let r = ts.handshake()
        try { ts.close() } catch (e: Exception) { () }
        return "OK ver=${r.version} cipher=${r.cipherSuite}"
    } catch (e: Exception) {
        return "EXC: ${e}"
    }
}

func hvClient(port: Int64, host: String): Client {
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    ccfg.supportedAlpnProtocols = ["h2"]
    return ClientBuilder().tlsConfig(ccfg).readTimeout(5 * Duration.second).build()
}

func hvReadBody(resp: HttpResponse): String {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(8192, repeat: 0)
    while (true) {
        let n = resp.body.read(chunk)
        if (n <= 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return String.fromUtf8(buffer.toArray())
}

@Test
class HuntHostnameVerify {
    @TestCase
    func hostnameMatchIpSan(): Unit {
        let (listener, port) = hvStartServer("end_rsa.cer", "end_rsa_private_key.pem")
        let r = hvClientHandshake(port, "127.0.0.1")
        listener.close()
        println("[HV-match] ${r}")
        @Expect(r.startsWith("OK"), true)
    }

    @TestCase
    func hostnameMismatchDnsName(): Unit {
        let (listener, port) = hvStartServer("end_rsa.cer", "end_rsa_private_key.pem")
        let r = hvClientHandshake(port, "localhost")
        listener.close()
        println("[HV-mismatch] ${r}")
        @Expect(r.startsWith("EXC"), true)
    }

    @TestCase
    func ipv6LoopbackTlsRoundTrip(): Unit {
        let listener = TcpServerSocket(bindAt: IPSocketAddress("::1", 4446))
        listener.bind()
        let served = AtomicBool(false)
        spawn {
            try {
                let tcp = listener.accept()
                var cfg = TlsServerConfig(X509Certificate.decodeFromPem(hvPem("end_rsa.cer")),
                    GeneralPrivateKey.decodeFromPem(hvPem("end_rsa_private_key.pem")))
                let ts = TlsSocket.server(tcp, serverConfig: cfg)
                let r = ts.handshake()
                let resp = "HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nok"
                ts.write(resp.toArray())
                ts.flush()
                sleep(Duration.millisecond * 300)
                try { ts.close() } catch (e: Exception) { () }
            } catch (e: Exception) { () }
            served.store(true)
        }
        sleep(Duration.millisecond * 100)
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(5 * Duration.second).build()
        var r6 = "EXC"
        try {
            let resp = c.get("https://[::1]:4446/b")
            r6 = "${resp.status}"
        } catch (e: Exception) {
            r6 = "EXC: ${e}"
        }
        c.close()
        listener.close()
        println("[IPv6-TLS] https://[::1] -> ${r6}")
        @Expect(r6, "200")
    }
}
