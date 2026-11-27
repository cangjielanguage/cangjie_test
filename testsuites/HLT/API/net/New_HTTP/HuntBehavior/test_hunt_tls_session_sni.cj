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

func tsPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func tsServerConf(version: TlsVersion): TlsServerConfig {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(tsPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(tsPem("end_rsa_private_key.pem")))
    cfg.supportedVersions = [version]
    return cfg
}

func tsClientConf(version: TlsVersion): TlsClientConfig {
    var cfg = TlsClientConfig()
    cfg.verifyMode = TrustAll
    cfg.supportedVersions = [version]
    return cfg
}

func tsStartListener(): (TcpServerSocket, Int64) {
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
    return (listener, port)
}

func tsClientHandshake(port: Int64, version: TlsVersion, session: ?TlsClientSession): (Bool, Int64, ?TlsClientSession) {
    let tcp = TcpSocket("127.0.0.1", UInt16(port))
    tcp.connect()
    let ts = TlsSocket.client(tcp, clientConfig: tsClientConf(version), session: session)
    let r = ts.handshake()
    var certCount: Int64 = 0
    try { certCount = Int64(r.peerCertificate.size) } catch (e: Exception) { certCount = -1 }
    var delivered = false
    var outSession: ?TlsClientSession = None<TlsClientSession>
    match (r.session) {
        case Some(s) =>
            outSession = (s as TlsClientSession).getOrThrow()
            delivered = true
        case None => delivered = false
    }
    try { ts.close() } catch (e: Exception) { () }
    return (delivered, certCount, outSession)
}

func tsServerHandshake(listener: TcpServerSocket, version: TlsVersion,
    sessionCtx: ?TlsServerSession): (Int64, String) {
    let tcp = listener.accept()
    let ts = match (sessionCtx) {
        case Some(ctx) => TlsSocket.server(tcp, serverConfig: tsServerConf(version), session: ctx)
        case None => TlsSocket.server(tcp, serverConfig: tsServerConf(version), session: None)
    }
    let r = ts.handshake()
    var certCount: Int64 = -1
    var sni = "<unset>"
    try { certCount = Int64(r.peerCertificate.size) } catch (e: Exception) { certCount = -2 }
    try { sni = "${r.serverName}" } catch (e: Exception) { sni = "<no-prop>" }
    try {
        let buf = Array<UInt8>(8192, repeat: 0)
        var head = ""
        while (!head.contains("\r\n\r\n")) {
            let n = ts.read(buf)
            if (n <= 0) { break }
            head = head + String.fromUtf8(buf[0..n])
        }
        ts.write("HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\nok".toArray())
        ts.flush()
        sleep(Duration.millisecond * 200)
    } catch (e: Exception) { () }
    try { ts.close() } catch (e: Exception) { () }
    return (certCount, sni)
}

func tsSniObserve(port: Int64, host: String): (String, String) {
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    let c = ClientBuilder().tlsConfig(ccfg).readTimeout(5 * Duration.second).build()
    var clientResult = "ok"
    try {
        let r = c.get("https://${host}:${port}/b")
        clientResult = "${r.status}"
    } catch (e: Exception) {
        clientResult = "EXC: ${e}"
    }
    c.close()
    return (clientResult, "done")
}

@Test
class HuntTlsSessionSni {
    @TestCase
    func tls12SessionResumption(): Unit {
        let ctx = TlsServerSession.fromName("hunt-tls12")
        let (listener, port) = tsStartListener()
        let done = AtomicBool(false)
        spawn {
            var i = 0
            while (i < 2) {
                try {
                    let (cc, _) = tsServerHandshake(listener, TlsVersion.V1_2, Some(ctx))
                    ()
                } catch (e: Exception) { break }
                i += 1
            }
            done.store(true)
        }
        sleep(Duration.millisecond * 100)
        let (delivered0, cert0, session) = tsClientHandshake(port, TlsVersion.V1_2, None<TlsClientSession>)
        let (delivered1, cert1, _) = tsClientHandshake(port, TlsVersion.V1_2, session)
        done.store(true)
        var w2: Int64 = 0
        while (!done.load() && w2 < 5000) { sleep(Duration.millisecond * 50); w2 += 50 }
        listener.close()
        println("[TLS12] delivered0=${delivered0} cert0=${cert0} delivered1=${delivered1} resumedCert=${cert1}")
        @Expect(delivered0, true)
        @Expect(cert0, 2)
        @Expect(cert1, 0)
    }

    @TestCase
    func tls13SessionMustBeDelivered(): Unit {
        let ctx = TlsServerSession.fromName("hunt-tls13")
        let (listener, port) = tsStartListener()
        let done = AtomicBool(false)
        spawn {
            try {
                let (_, _) = tsServerHandshake(listener, TlsVersion.V1_3, Some(ctx))
            } catch (e: Exception) { () }
            done.store(true)
        }
        sleep(Duration.millisecond * 100)
        let (delivered, certCount) = match (tsClientHandshake(port, TlsVersion.V1_3, None<TlsClientSession>)) {
            case (d, c, _) => (d, c)
        }
        done.store(true)
        var w2: Int64 = 0
        while (!done.load() && w2 < 5000) { sleep(Duration.millisecond * 50); w2 += 50 }
        listener.close()
        println("[TLS13] sessionDelivered=${delivered} serverCertCount=${certCount}")
        @Expect(delivered, true)
    }

    @TestCase
    func sniHostnameSent(): Unit {
        let (listener, port) = tsStartListener()
        let done = AtomicBool(false)
        let sniSeen = ArrayList<String>()
        spawn {
            try {
                let (_, sni) = tsServerHandshake(listener, TlsVersion.V1_2, None<TlsServerSession>)
                sniSeen.add(sni)
            } catch (e: Exception) { () }
            done.store(true)
        }
        sleep(Duration.millisecond * 100)
        let (clientResult, _) = tsSniObserve(port, "localhost")
        var w2: Int64 = 0
        while (!done.load() && w2 < 5000) { sleep(Duration.millisecond * 50); w2 += 50 }
        listener.close()
        var sni = "<none>"
        if (sniSeen.size > 0) { sni = sniSeen[0] }
        println("[SNI-localhost] client=${clientResult} serverName=<${sni}>")
        @Expect(clientResult, "200")
        @Expect(sni, "localhost")
    }

    @TestCase
    func sniUppercaseLowercased(): Unit {
        let (listener, port) = tsStartListener()
        let done = AtomicBool(false)
        let sniSeen = ArrayList<String>()
        spawn {
            try {
                let (_, sni) = tsServerHandshake(listener, TlsVersion.V1_2, None<TlsServerSession>)
                sniSeen.add(sni)
            } catch (e: Exception) { () }
            done.store(true)
        }
        sleep(Duration.millisecond * 100)
        let (clientResult, _) = tsSniObserve(port, "LOCALHOST")
        var w2: Int64 = 0
        while (!done.load() && w2 < 5000) { sleep(Duration.millisecond * 50); w2 += 50 }
        listener.close()
        var sni = "<none>"
        if (sniSeen.size > 0) { sni = sniSeen[0] }
        println("[SNI-uppercase] client=${clientResult} serverName=<${sni}>")
        @Expect(sni, "localhost")
    }

    @TestCase
    func ipv6LoopbackTlsRoundTrip(): Unit {
        let listener = TcpServerSocket(bindAt: IPSocketAddress("::1", 4446))
        listener.bind()
        let served = AtomicBool(false)
        spawn {
            try {
                let tcp = listener.accept()
                var cfg = TlsServerConfig(X509Certificate.decodeFromPem(tsPem("end_rsa.cer")),
                    GeneralPrivateKey.decodeFromPem(tsPem("end_rsa_private_key.pem")))
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
        println("[IP6-TLS] https://[::1] -> ${r6}")
        @Expect(r6, "200")
    }
    @TestCase
    func sniIpLiteralMustBeAbsent(): Unit {
        let (listener, port) = tsStartListener()
        let done = AtomicBool(false)
        let sniSeen = ArrayList<String>()
        spawn {
            try {
                let (_, sni) = tsServerHandshake(listener, TlsVersion.V1_2, None<TlsServerSession>)
                sniSeen.add(sni)
            } catch (e: Exception) { () }
            done.store(true)
        }
        sleep(Duration.millisecond * 100)
        let (clientResult, _) = tsSniObserve(port, "127.0.0.1")
        var w2: Int64 = 0
        while (!done.load() && w2 < 5000) { sleep(Duration.millisecond * 50); w2 += 50 }
        listener.close()
        var sni = "<none>"
        if (sniSeen.size > 0) { sni = sniSeen[0] }
        println("[SNI-ip] client=${clientResult} serverName=<${sni}>")
        @Expect(sni, "")
    }

    @TestCase
    func sniTrailingDotMustBeStripped(): Unit {
        let (listener, port) = tsStartListener()
        let done = AtomicBool(false)
        let sniSeen = ArrayList<String>()
        spawn {
            try {
                let (_, sni) = tsServerHandshake(listener, TlsVersion.V1_2, None<TlsServerSession>)
                sniSeen.add(sni)
            } catch (e: Exception) { () }
            done.store(true)
        }
        sleep(Duration.millisecond * 100)
        let (clientResult, _) = tsSniObserve(port, "localhost.")
        var w2: Int64 = 0
        while (!done.load() && w2 < 5000) { sleep(Duration.millisecond * 50); w2 += 50 }
        listener.close()
        var sni = "<none>"
        if (sniSeen.size > 0) { sni = sniSeen[0] }
        println("[SNI-dot] client=${clientResult} serverName=<${sni}>")
        @Expect(sni, "localhost")
    }
}
