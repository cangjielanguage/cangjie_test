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

// Hunt pins for issues 62/63/64 (2026-11-24 baseline candidates):
// - issue 62 [RED] poolSize(1) + unread response body -> next sequential request rejected
//   (connection not returned/counted; okhttp/Go drain small unread bodies)
// - issue 63 [RED] TLS handshake has no timeout -> blocks indefinitely against a
//   listener that never accepts (F106; related to issue 27 connect-phase timeout)
// - issue 64 [GREEN] undocumented default header size limits documented as pins:
//   server total 8192 / single 32768 (431), client response ReadLine 32768

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

func hptPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func hptPortOf(listener: TcpServerSocket): Int64 {
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

func hptPortOfSrv(server: Server): Int64 {
    while (server.port == 0) { sleep(Duration.millisecond) }
    return Int64(server.port)
}

func hptReadAll(sock: TcpSocket): String {
    let buf = Array<UInt8>(65536, repeat: 0)
    var reply = ""
    while (true) {
        var n: Int64 = 0
        var err = false
        try { n = sock.read(buf) } catch (e: Exception) { err = true }
        if (err || n <= 0) { break }
        reply += String.fromUtf8(buf[0..n])
    }
    return reply
}

func hptBodyOf(r: HttpResponse): String {
    let buf = ArrayList<UInt8>()
    let chunk = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = r.body.read(chunk)
        if (n <= 0) { break }
        for (i in 0..n) { buf.add(chunk[i]) }
    }
    return String.fromUtf8(buf.toArray())
}

@Test
class HuntPoolTlsHeaderLimits {
    // RED (issue 62): unread body must NOT break the next sequential request on poolSize(1)
    @TestCase
    func poolOneUnreadBodyNextRequestOk(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        spawn { s.serve() }
        let port = hptPortOfSrv(s)
        sleep(Duration.millisecond * 100)
        let c = ClientBuilder().poolSize(1).readTimeout(Duration.second * 5).build()
        let r0 = c.get("http://127.0.0.1:${port}/")
        println("[62] req0 status=${r0.status}")
        @Expect(r0.status, 200)
        try {
            let r1 = c.get("http://127.0.0.1:${port}/")   // body of r0 unread; okhttp/Go still succeed
            println("[62] req1 status=${r1.status}")
            @Expect(r1.status, 200)
        } catch (e: Exception) {
            @Fail("[62] req1 rejected after unread body: ${e}")   // Too many connections to the same server.
        }
        c.close()
        s.close()
    }

    // GREEN guard (issue 62): consumed body path stays healthy
    @TestCase
    func poolOneConsumedBodyOk(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        spawn { s.serve() }
        let port = hptPortOfSrv(s)
        sleep(Duration.millisecond * 100)
        let c = ClientBuilder().poolSize(1).readTimeout(Duration.second * 5).build()
        for (i in 0..3) {
            let r = c.get("http://127.0.0.1:${port}/")
            println("[62g] req${i} body=${hptBodyOf(r)}")
            @Expect(r.status, 200)
        }
        c.close()
        s.close()
    }

    // RED (issue 63): TLS handshake must terminate (done or exception) within 8s
    // even when the server never accepts. Currently blocks indefinitely -> flag stays false.
    @TestCase
    func tlsHandshakeTerminatesWithin8s(): Unit {
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        // deliberately NO accept(): connections stay in backlog forever
        let port = hptPortOf(listener)
        let ended = AtomicBool(false)
        spawn {
            try {
                let tcp = TcpSocket("127.0.0.1", UInt16(port))
                tcp.connect()
                var ccfg = TlsClientConfig()
                ccfg.verifyMode = TrustAll
                let ts = TlsSocket.client(tcp, clientConfig: ccfg)
                let r = ts.handshake()   // currently blocks forever (no timeout mechanism)
                println("[63] handshake done ver=${r.version}")
                try { ts.close() } catch (e: Exception) { () }
            } catch (e: Exception) {
                println("[63] handshake raised: ${e}")   // fixed behavior: timeout exception
            }
            ended.store(true)
        }
        // settle for up to 8s
        var waited = 0
        while (waited < 8000 && !ended.load()) {
            sleep(Duration.millisecond * 100)
            waited += 100
        }
        listener.close()
        println("[63] handshake terminated within 8s = ${ended.load()}")
        @Expect(ended.load(), true)   // RED: currently false (indefinite block)
    }

    // GREEN guard (issue 63): normal handshake against a real TLS server still completes
    @TestCase
    func tlsHandshakeNormalCompletes(): Unit {
        let scfg = TlsServerConfig(X509Certificate.decodeFromPem(hptPem("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(hptPem("end_rsa_private_key.pem")))
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        spawn {
            try {
                let tcp = listener.accept()
                try {
                    let ts = TlsSocket.server(tcp, serverConfig: scfg)
                    let rr = ts.handshake()
                    ts.write("ok".toArray())
                    ts.flush()
                    sleep(Duration.millisecond * 200)
                    try { ts.close() } catch (e: Exception) { () }
                } catch (e: Exception) { () }
            } catch (e: Exception) { () }
        }
        let port = hptPortOf(listener)
        sleep(Duration.millisecond * 100)
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        let tcp = TcpSocket("127.0.0.1", UInt16(port))
        tcp.connect()
        let ts = TlsSocket.client(tcp, clientConfig: ccfg)
        let r = ts.handshake()
        println("[63g] normal handshake ver=${r.version}")
        @Expect(r.cipherSuite.size > 0, true)
        try { ts.close() } catch (e: Exception) { () }
        listener.close()
    }

    // GREEN (issue 64): server default TOTAL request header limit = 8192 -> 431
    @TestCase
    func serverRejects30kTotalWith431(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()   // default config, no maxRequestHeaderSize
        s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        spawn { s.serve() }
        let port = hptPortOfSrv(s)
        sleep(Duration.millisecond * 100)
        let v = String.fromUtf8(Array<UInt8>(30 * 1024, repeat: 0x41))
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        sock.write("GET / HTTP/1.1\r\nHost: a\r\nConnection: close\r\nX-Long: ${v}\r\n\r\n".toArray())
        let reply = hptReadAll(sock)
        sock.close()
        s.close()
        println("[64a] status-line=${reply.split("\r\n")[0]}")
        @Expect(reply.contains("431"), true)
        @Expect(reply.contains("Total header size exceeds limit '8192'"), true)
    }

    // GREEN (issue 64): server default SINGLE header limit = 32768 -> 431
    @TestCase
    func serverRejects33kSingleWith431(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        spawn { s.serve() }
        let port = hptPortOfSrv(s)
        sleep(Duration.millisecond * 100)
        let v = String.fromUtf8(Array<UInt8>(33 * 1024, repeat: 0x41))
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        sock.write("GET / HTTP/1.1\r\nHost: a\r\nConnection: close\r\nX-Long: ${v}\r\n\r\n".toArray())
        let reply = hptReadAll(sock)
        sock.close()
        s.close()
        println("[64b] status-line=${reply.split("\r\n")[0]}")
        @Expect(reply.contains("431"), true)
        @Expect(reply.contains("Single header size exceeds limit '32768'"), true)
    }

    // GREEN (issue 64): client response line ReadLine limit = 32768 -> exception
    @TestCase
    func clientReadLine33kRejected(): Unit {
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        spawn {
            while (true) {
                try {
                    let sock = listener.accept()
                    spawn {
                        try {
                            let big = String.fromUtf8(Array<UInt8>(36 * 1024, repeat: 0x41))
                            sock.write("HTTP/1.1 200 OK\r\nX-Big: ${big}\r\nContent-Length: 2\r\n\r\nhi".toArray())
                            sleep(Duration.millisecond * 200)
                            sock.close()
                        } catch (e: Exception) { () }
                    }
                } catch (e: Exception) { return }
            }
        }
        let port = hptPortOf(listener)
        sleep(Duration.millisecond * 100)
        let c = ClientBuilder().readTimeout(Duration.second * 5).build()
        var rejected = false
        var detail = ""
        try {
            let r = c.get("http://127.0.0.1:${port}/")
            detail = "status=${r.status}"
        } catch (e: Exception) {
            rejected = true
            detail = "${e}"
        }
        c.close()
        listener.close()
        println("[64c] rejected=${rejected} detail=${detail}")
        @Expect(rejected, true)
        @Expect(detail.contains("ReadLine size"), true)   // e.g. ReadLine size 36865 exceeds limit 32768.
    }
}
