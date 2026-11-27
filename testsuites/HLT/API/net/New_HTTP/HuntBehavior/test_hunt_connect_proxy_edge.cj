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
import stdx.crypto.kit.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*
import stdx.encoding.url.*
import std.net.*
import std.io.*
import std.convert.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func cpPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func cpTlsEchoServer(): (Server, Int64) {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(cpPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(cpPem("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["http/1.1"]
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
    s.distributor.register("/", { ctx => ctx.responseBuilder.body("tls-via-tunnel") })
    s.distributor.register("/ws", { ctx =>
        let w = WebSocket.upgradeFromServer(ctx)
        let f = w.read()
        w.write(TextWebFrame, f.payload)
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return (s, Int64(s.port))
}

func cpReadHead(sock: TcpSocket): String {
    let acc = ArrayList<UInt8>()
    let tmp = Array<UInt8>(4096, repeat: 0)
    while (true) {
        var n = 0
        var err = false
        try { n = sock.read(tmp) } catch (e: Exception) { err = true }
        if (err || n <= 0) { break }
        for (i in 0..n) { acc.add(tmp[i]) }
        if (String.fromUtf8(acc.toArray()).contains("\r\n\r\n")) { break }
    }
    return String.fromUtf8(acc.toArray())
}

func cpPipe(a: TcpSocket, b: TcpSocket): Unit {
    let stop = AtomicBool(false)
    spawn {
        let buf = Array<UInt8>(8192, repeat: 0)
        while (!stop.load()) {
            var n = 0
            var err = false
            try { n = a.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            b.write(buf[0..n])
        }
        stop.store(true)
        try { b.close() } catch (x: Exception) { () }
    }
    let buf2 = Array<UInt8>(8192, repeat: 0)
    while (!stop.load()) {
        var n = 0
        var err = false
        try { n = b.read(buf2) } catch (e: Exception) { err = true }
        if (err || n <= 0) { break }
        a.write(buf2[0..n])
    }
    stop.store(true)
    try { a.close() } catch (x: Exception) { () }
}

func cpStartProxy(caseId: String, upstream: ?Int64, resp: String): (TcpServerSocket, Int64) {
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
        while (true) {
            try {
                let sock = listener.accept()
                spawn {
                    sock.readTimeout = Duration.second * 10
                    try {
                        let head = cpReadHead(sock)
                        if (caseId == "407") {
                            sock.write("HTTP/1.1 407 Proxy Authentication Required\r\nProxy-Authenticate: Basic realm=\"mitm\"\r\nContent-Length: 0\r\n\r\n".toArray())
                        } else if (caseId == "502") {
                            var okUp = false
                            try {
                                let up = TcpSocket("127.0.0.1", UInt16(1))
                                up.connect()
                                okUp = true
                            } catch (e: Exception) { okUp = false }
                            sock.write("HTTP/1.1 502 Bad Gateway\r\nContent-Length: 0\r\n\r\n".toArray())
                        } else {
                            sock.write(resp.toArray())
                            match (upstream) {
                                case Some(port2) =>
                                    let up = TcpSocket("127.0.0.1", UInt16(port2))
                                    up.connect()
                                    cpPipe(sock, up)
                                    return
                                case None => ()
                            }
                        }
                    } catch (e: Exception) { println("[cp-proxy] ${e}") }
                    try { sock.close() } catch (x: Exception) { () }
                }
            } catch (e: Exception) { return }
        }
    }
    return (listener, port)
}

func cpClient(proxyPort: Int64): Client {
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    return ClientBuilder().httpsProxy("http://127.0.0.1:${proxyPort}")
        .tlsConfig(ccfg).readTimeout(6 * Duration.second).build()
}

func cpTryGet(c: Client, url: String): String {
    let t0 = DateTime.now()
    try {
        let r = c.get(url)
        return "status=${r.status} elapsed=${(DateTime.now() - t0).toMilliseconds()}ms"
    } catch (e: Exception) {
        return "EXC elapsed=${(DateTime.now() - t0).toMilliseconds()}ms msg=[${e.message}]"
    }
}

@Test
class ConnectProxyEdge {
    // RED (issue 57): CONNECT 407 must surface status + challenge (non-empty error)
    @TestCase
    func connect407Observable(): Unit {
        let (pl, pp) = cpStartProxy("407", None<Int64>, "")
        let c = cpClient(pp)
        let out = cpTryGet(c, "https://127.0.0.1:19499/")
        c.close()
        pl.close()
        println("[cp57-407] => ${out}")
        @Expect(out.contains("msg=[]"), false)
    }

    // RED (issue 57): CONNECT 502 must surface status (non-empty error)
    @TestCase
    func connect502Observable(): Unit {
        let (pl, pp) = cpStartProxy("502", None<Int64>, "")
        let c = cpClient(pp)
        let out = cpTryGet(c, "https://127.0.0.1:1/")
        c.close()
        pl.close()
        println("[cp57-502] => ${out}")
        @Expect(out.contains("msg=[]"), false)
    }

    // GREEN: websocket (wss) end-to-end through a CONNECT tunnel
    @TestCase
    func wssOverConnectTunnel(): Unit {
        let (s, sp) = cpTlsEchoServer()
        let (pl, pp) = cpStartProxy("tunnel", Some(sp), "HTTP/1.1 200 Connection Established\r\n\r\n")
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        ccfg.supportedAlpnProtocols = ["http/1.1"]
        var out = ""
        try {
            let c = ClientBuilder().httpsProxy("http://127.0.0.1:${pp}").tlsConfig(ccfg)
                .readTimeout(6 * Duration.second).build()
            let (ws, _) = WebSocket.upgradeFromClient(c, URL.parse("wss://127.0.0.1:${sp}/ws"))
            ws.write(TextWebFrame, "ws-via-proxy".toArray())
            let frame = ws.read()
            out = "payload=[${String.fromUtf8(frame.payload)}]"
            c.close()
        } catch (e: Exception) { out = "EXC: ${e.message}" }
        pl.close()
        s.close()
        println("[cp-M5] wss-over-connect => ${out}")
        @Expect(out, "payload=[ws-via-proxy]")
    }

    // GREEN: HTTP/1.0 200 + tunnel — end-to-end through CONNECT
    @TestCase
    func http10TunnelEndToEnd(): Unit {
        let (s, sp) = cpTlsEchoServer()
        let (pl, pp) = cpStartProxy("tunnel", Some(sp), "HTTP/1.0 200 Connection established\r\n\r\n")
        let c = cpClient(pp)
        let out = cpTryGet(c, "https://127.0.0.1:${sp}/")
        c.close()
        pl.close()
        s.close()
        println("[cp-M7] http1.0-tunnel => ${out}")
        @Expect(out.startsWith("status=200"), true)
    }
}
