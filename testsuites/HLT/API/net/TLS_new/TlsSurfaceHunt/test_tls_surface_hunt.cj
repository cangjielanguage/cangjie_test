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

import stdx.net.tls.*
import stdx.net.tls.common.*
import stdx.net.tls.SignatureAlgorithm as TlsSigAlg
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

func tshPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func tshCa(name: String): CertificateVerifyMode {
    return CustomCA(X509Certificate.decodeFromPem(tshPem(name)).map({c => c}))
}

class TshLog {
    static let lines = ArrayList<String>()
    static func add(s: String): Unit { lines.add(s) }
    static func clear(): Unit { lines.clear() }
    static func hasTrafficSecret(): Bool {
        for (l in lines) { if (l.contains("TRAFFIC_SECRET")) { return true } }
        return false
    }
    static func dump(): String {
        let sb = StringBuilder()
        for (l in lines) { sb.append(l); sb.append(" | ") }
        return sb.toString()
    }
}

func tshHandshake(serverTweak: (TlsServerConfig) -> TlsServerConfig,
        clientTweak: (TlsClientConfig) -> TlsClientConfig): (Bool, String) {
    let listener = TcpServerSocket(bindAt: 0)
    listener.bind()
    var port: Int64 = 0
    var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(tshPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(tshPem("end_rsa_private_key.pem")))
    serverConf = serverTweak(serverConf)
    let sc = serverConf
    spawn {
        while (true) {
            try {
                let sock = listener.accept()
                spawn {
                    try {
                        let ts = TlsSocket.server(sock, serverConfig: sc)
                        let r = ts.handshake()
                        TshLog.add("srv-ok ver=${r.version} cipher=${r.cipherSuite}")
                    } catch (e: Exception) {
                        TshLog.add("srv-fail ${e}")
                    }
                }
            } catch (e: Exception) { return }
        }
    }
    while (port == 0) {
        sleep(Duration.millisecond)
        let t = listener.localAddress.toString()
        match (t.lastIndexOf(":")) {
            case Some(i) => port = Int64.parse(t[i + 1..])
            case None => ()
        }
    }
    var clientConf = TlsClientConfig()
    clientConf.verifyMode = tshCa("root_rsa.cer")
    clientConf = clientTweak(clientConf)
    let tcp = TcpSocket("127.0.0.1", UInt16(port))
    tcp.connect()
    let tc = TlsSocket.client(tcp, clientConfig: clientConf)
    var ok = false
    var detail = ""
    try {
        let r = tc.handshake()
        ok = true
        detail = "OK ver=${r.version} cipher=${r.cipherSuite}"
    } catch (e: Exception) {
        detail = "${e}"
    }
    listener.close()
    return (ok, detail)
}

@Test
class TlsSurfaceHunt {
    @TestCase
    func keylogCallbackFires(): Unit {
        TshLog.clear()
        let clientKeylog: ?(TlsSocket, String) -> Unit = Some({ sock, line => TshLog.add("client-keylog " + line) })
        let serverKeylog: ?(TlsSocket, String) -> Unit = Some({ sock, line => TshLog.add("server-keylog " + line) })
        let (ok, detail) = tshHandshake(
            { cfg => var c = cfg; c.keylogCallback = serverKeylog; c },
            { cfg => var c = cfg; c.keylogCallback = clientKeylog; c })
        println("[tsh] keylog: ok=${ok} ${detail}")
        @Expect(ok, true)
        @Expect(TshLog.hasTrafficSecret(), true)
    }

    @TestCase
    func dheSuiteNegotiable(): Unit {
        let (ok, detail) = tshHandshake(
            { cfg =>
                var c = cfg
                var m = HashMap<TlsVersion, Array<String>>()
                m[V1_2] = ["DHE-RSA-AES256-GCM-SHA384"]
                c.supportedCipherSuites = m
                c.supportedVersions = [V1_2]
                c
            },
            { cfg =>
                var c = cfg
                var m = HashMap<TlsVersion, Array<String>>()
                m[V1_2] = ["DHE-RSA-AES256-GCM-SHA384"]
                c.supportedCipherSuites = m
                c.supportedVersions = [V1_2]
                c
            })
        println("[tsh] dhe: ${detail}")
        @Expect(ok, true)
        @Expect(detail.contains("DHE-RSA-AES256-GCM-SHA384"), true)
    }

    @TestCase
    func sigAlgsEcdsaOnlyRejected(): Unit {
        let (ok, detail) = tshHandshake(
            { cfg => var c = cfg; c },
            { cfg => var c = cfg; c.signatureAlgorithms = [TlsSigAlg.SignatureScheme(SignatureSchemeType.ECDSA_SECP256R1_SHA256), TlsSigAlg.SignatureScheme(SignatureSchemeType.ECDSA_SECP384R1_SHA384)]; c })
        println("[tsh] ecdsa-only vs rsa cert: ${detail}")
        @Expect(ok, false)
    }

    @TestCase
    func securityLevel5RejectsRsa2048(): Unit {
        let (ok, detail) = tshHandshake(
            { cfg => var c = cfg; c.securityLevel = 5; c },
            { cfg => var c = cfg; c })
        println("[tsh] securityLevel=5 + rsa2048: ${detail}")
        @Expect(ok, false)
    }

    @TestCase
    func tls12SessionResumption(): Unit {
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        var port: Int64 = 0
        var serverConf = TlsServerConfig(X509Certificate.decodeFromPem(tshPem("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(tshPem("end_rsa_private_key.pem")))
        serverConf.supportedVersions = [V1_2]
        let sc = serverConf
        spawn {
            while (true) {
                try {
                    let sock = listener.accept()
                    spawn {
                        try {
                            let ts = TlsSocket.server(sock, serverConfig: sc)
                            let _ = ts.handshake()
                        } catch (e: Exception) { () }
                    }
                } catch (e: Exception) { return }
            }
        }
        while (port == 0) {
            sleep(Duration.millisecond)
            let t = listener.localAddress.toString()
            match (t.lastIndexOf(":")) {
                case Some(i) => port = Int64.parse(t[i + 1..])
                case None => ()
            }
        }
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = tshCa("root_rsa.cer")
        ccfg.supportedVersions = [V1_2]
        let tcp1 = TcpSocket("127.0.0.1", UInt16(port))
        tcp1.connect()
        let tc1 = TlsSocket.client(tcp1, clientConfig: ccfg)
        let r1 = tc1.handshake()
        @Expect(r1.version, TlsVersion.V1_2)
        match (r1.session) {
            case Some(s) =>
                match (s as TlsClientSession) {
                    case Some(cs) =>
                        let tcp2 = TcpSocket("127.0.0.1", UInt16(port))
                        tcp2.connect()
                        let tc2 = TlsSocket.client(tcp2, clientConfig: ccfg, session: Some(cs))
                        let r2 = tc2.handshake()
                        println("[tsh] tls12 resumed: ver=${r2.version} cipher=${r2.cipherSuite}")
                        @Expect(r2.version, TlsVersion.V1_2)
                    case None => @Expect(false, true)   // session is not TlsClientSession
                }
            case None => @Expect(false, true)           // TLS1.2 session must be delivered in-handshake
        }
        listener.close()
    }

    @TestCase
    func sigAlgsRsaComboNegotiates(): Unit {
        TshLog.clear()
        let (ok, detail) = tshHandshake(
            { cfg => var c = cfg; c },
            { cfg => var c = cfg; c.signatureAlgorithms = [TlsSigAlg.SignatureScheme(SignatureSchemeType.RSA_PKCS1_SHA256),
                TlsSigAlg.SignatureScheme(SignatureSchemeType.RSA_PSS_RSAE_SHA256),
                TlsSigAlg.SignatureScheme(SignatureSchemeType.RSA_PKCS1_SHA384),
                TlsSigAlg.SignatureScheme(SignatureSchemeType.RSA_PSS_RSAE_SHA384)]; c })
        println("[tsh] rsa combo sigAlgs: ${detail}")
        var srv = TshLog.dump()
        if (srv.size > 200) { srv = srv[0..200] }
        println("[tsh] server log: ${srv}")
        @Expect(ok, true)
    }
}
