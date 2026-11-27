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

func grPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func grServerTls(): TlsServerConfig {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(grPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(grPem("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["h2"]
    return cfg
}

func grU8(v: Int64): UInt8 { return UInt8(v & 0xFF) }

func grFrame(ftype: UInt8, flags: UInt8, sid: Int64, payload: Array<UInt8>): Array<UInt8> {
    let out = Array<UInt8>(9 + payload.size, repeat: 0)
    let l = payload.size
    out[0] = grU8(l >> 16); out[1] = grU8(l >> 8); out[2] = grU8(l)
    out[3] = ftype; out[4] = flags
    let id = sid & 0x7FFFFFFF
    out[5] = grU8(id >> 24); out[6] = grU8(id >> 16); out[7] = grU8(id >> 8); out[8] = grU8(id)
    for (i in 0..payload.size) { out[9 + i] = payload[i] }
    return out
}

func grLit(name: String, value: String): ArrayList<UInt8> {
    let out = ArrayList<UInt8>()
    out.add(0x00)
    let n = name.toArray(); let vb = value.toArray()
    out.add(grU8(n.size))
    for (b in n) { out.add(b) }
    out.add(grU8(vb.size))
    for (b in vb) { out.add(b) }
    return out
}

func grReadExact(sock: TlsSocket, buf: Array<UInt8>): Bool {
    var got = 0
    while (got < buf.size) {
        let n = sock.read(buf[got..])
        if (n <= 0) { return false }
        got += n
    }
    return true
}

func grReadFrame(sock: TlsSocket): (Bool, UInt8, UInt8, Int64, Array<UInt8>) {
    let h = Array<UInt8>(9, repeat: 0)
    if (!grReadExact(sock, h)) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    let len = (Int64(h[0]) << 16) + (Int64(h[1]) << 8) + Int64(h[2])
    var sid = (Int64(h[5]) << 24) + (Int64(h[6]) << 16) + (Int64(h[7]) << 8) + Int64(h[8])
    sid = sid & 0x7FFFFFFF
    let payload = Array<UInt8>(len, repeat: 0)
    if (len > 0) {
        if (!grReadExact(sock, payload)) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    }
    return (true, h[3], h[4], sid, payload)
}

func grStartScripted(script: (TlsSocket) -> Unit): (TcpServerSocket, Int64) {
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
                let tcp = listener.accept()
                let sock = TlsSocket.server(tcp, serverConfig: grServerTls())
                sock.handshake()
                let pre = Array<UInt8>(24, repeat: 0)
                if (!grReadExact(sock, pre)) { try { sock.close() } catch (x: Exception) { () }; continue }
                let (ok, t, fl, sid, pl) = grReadFrame(sock)
                if (!ok || t != 0x4) { try { sock.close() } catch (x: Exception) { () }; continue }
                sock.write(grFrame(0x4, 0, 0, Array<UInt8>(0, repeat: 0)))
                sock.write(grFrame(0x4, 0x1, 0, Array<UInt8>(0, repeat: 0)))
                spawn {
                    try { script(sock) } catch (e: Exception) { println("[gr-srv] ${e}") }
                    try { sock.close() } catch (x: Exception) { () }
                }
            } catch (e: Exception) { return }
        }
    }
    return (listener, port)
}

func grH2Client(port: Int64): Client {
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    ccfg.supportedAlpnProtocols = ["h2"]
    return ClientBuilder().tlsConfig(ccfg).readTimeout(6 * Duration.second).build()
}

func grBody(resp: HttpResponse): String {
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
class GrpcSemantics {
    // RED (issue 56): standard gRPC trailers (:status + grpc-status) must not fail the response
    @TestCase
    func grpcTrailersWithStatusAccepted(): Unit {
        let (listener, port) = grStartScripted({ sock =>
            var g = 0
            var gotReq = false
            while (!gotReq && g < 30) {
                g += 1
                let (ok, t, fl, sid, pl) = grReadFrame(sock)
                if (!ok) { return }
                if (t == 0x4 && (fl & 0x1) == 0) { sock.write(grFrame(0x4, 0x1, 0, Array<UInt8>(0, repeat: 0))) }
                if (t == 0x6 && (fl & 0x1) == 0) { sock.write(grFrame(0x6, 0x1, 0, pl)) }
                if (t == 0x1) { gotReq = true }
            }
            var hdr = ArrayList<UInt8>()
            hdr.add(0x88)
            for (b in grLit("content-type", "application/grpc")) { hdr.add(b) }
            sock.write(grFrame(0x1, 0x4, 1, hdr.toArray()))
            sock.write(grFrame(0x0, 0x0, 1, "grpc-payload".toArray()))
            var tr = ArrayList<UInt8>()
            tr.add(0x88)
            for (b in grLit("grpc-status", "0")) { tr.add(b) }
            sock.write(grFrame(0x1, 0x5, 1, tr.toArray()))
        })
        sleep(Duration.millisecond * 150)
        let c = grH2Client(port)
        var out = ""
        try {
            let resp = c.send(HttpRequestBuilder().url("https://127.0.0.1:${port}/pkg.Svc/M")
                .header("content-type", "application/grpc").body("grpc-request").build())
            out = "status=${resp.status} body=[${grBody(resp)}]"
        } catch (e: Exception) {
            out = "EXC: ${e.message}"
        }
        c.close()
        listener.close()
        println("[gr56] trailers-with-status => ${out}")
        @Expect(out.contains("EXC"), false)
    }

    // GREEN: trailers-only response (single HEADERS with END_STREAM) parses cleanly
    @TestCase
    func trailersOnlyResponseParses(): Unit {
        let (listener, port) = grStartScripted({ sock =>
            var g = 0
            var gotReq = false
            while (!gotReq && g < 30) {
                g += 1
                let (ok, t, fl, sid, pl) = grReadFrame(sock)
                if (!ok) { return }
                if (t == 0x4 && (fl & 0x1) == 0) { sock.write(grFrame(0x4, 0x1, 0, Array<UInt8>(0, repeat: 0))) }
                if (t == 0x6 && (fl & 0x1) == 0) { sock.write(grFrame(0x6, 0x1, 0, pl)) }
                if (t == 0x1) { gotReq = true }
            }
            var hdr = ArrayList<UInt8>()
            hdr.add(0x88)
            for (b in grLit("content-type", "application/grpc")) { hdr.add(b) }
            for (b in grLit("grpc-status", "3")) { hdr.add(b) }
            sock.write(grFrame(0x1, 0x5, 1, hdr.toArray()))
        })
        sleep(Duration.millisecond * 150)
        let c = grH2Client(port)
        var out = ""
        try {
            let resp = c.send(HttpRequestBuilder().url("https://127.0.0.1:${port}/pkg.Svc/M")
                .header("content-type", "application/grpc").build())
            out = "status=${resp.status} bodyLen=${grBody(resp).size}"
        } catch (e: Exception) {
            out = "EXC: ${e.message}"
        }
        c.close()
        listener.close()
        println("[gr-G1] trailers-only => ${out}")
        @Expect(out, "status=200 bodyLen=0")
    }

    // GREEN: client TE: trailers header reaches the server (gRPC prerequisite)
    @TestCase
    func teTrailersHeaderForwarded(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(grServerTls()).build()
        let teSeen = AtomicBool(false)
        let teExact = AtomicBool(false)
        s.distributor.register("/pkg.Svc/M", { ctx =>
            let te = ctx.request.headers.getFirst("te") ?? "absent"
            teSeen.store(te != "absent")
            teExact.store(te == "trailers")
            ctx.responseBuilder.header("content-type", "application/grpc").body("ok")
        })
        spawn { s.serve() }
        while (s.port == 0) { sleep(Duration.millisecond) }
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        ccfg.supportedAlpnProtocols = ["h2"]
        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(6 * Duration.second).build()
        var out = ""
        try {
            let resp = c.send(HttpRequestBuilder().url("https://127.0.0.1:${s.port}/pkg.Svc/M")
                .header("content-type", "application/grpc")
                .header("te", "trailers")
                .body("grpc-request").build())
            out = "status=${resp.status}"
        } catch (e: Exception) {
            out = "EXC: ${e.message}"
        }
        c.close()
        sleep(Duration.millisecond * 200)
        s.close()
        println("[gr-G3] te-header => client=${out} teSeen=${teSeen.load()} teExact=${teExact.load()}")
        @Expect(teSeen.load() && teExact.load(), true)
    }
}
