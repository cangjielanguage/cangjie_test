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

func hsPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func hsU8(v: Int64): UInt8 { return UInt8(v & 0xFF) }

func hsFrame(ftype: UInt8, flags: UInt8, sid: Int64, payload: Array<UInt8>): Array<UInt8> {
    let out = Array<UInt8>(9 + payload.size, repeat: 0)
    let l = payload.size
    out[0] = hsU8(l >> 16); out[1] = hsU8(l >> 8); out[2] = hsU8(l)
    out[3] = ftype; out[4] = flags
    let id = sid & 0x7FFFFFFF
    out[5] = hsU8(id >> 24); out[6] = hsU8(id >> 16); out[7] = hsU8(id >> 8); out[8] = hsU8(id)
    for (i in 0..payload.size) { out[9 + i] = payload[i] }
    return out
}

func hsHpackReq(port: Int64, path: String): Array<UInt8> {
    let out = ArrayList<UInt8>()
    let pairs = [(":method", "GET"), (":scheme", "https"),
        (":path", path), (":authority", "127.0.0.1:${port}")]
    for ((k, v) in pairs) {
        out.add(0x00)
        let n = k.toArray(); let vb = v.toArray()
        out.add(hsU8(n.size))
        for (b in n) { out.add(b) }
        out.add(hsU8(vb.size))
        for (b in vb) { out.add(b) }
    }
    return out.toArray()
}

func hsReadExact(sock: TlsSocket, buf: Array<UInt8>): Bool {
    var got = 0
    while (got < buf.size) {
        let n = sock.read(buf[got..])
        if (n <= 0) { return false }
        got += n
    }
    return true
}

func hsReadFrame(sock: TlsSocket): (Bool, UInt8, UInt8, Int64, Array<UInt8>) {
    let h = Array<UInt8>(9, repeat: 0)
    if (!hsReadExact(sock, h)) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    let len = (Int64(h[0]) << 16) + (Int64(h[1]) << 8) + Int64(h[2])
    let ftype = h[3]
    let flags = h[4]
    var sid = (Int64(h[5]) << 24) + (Int64(h[6]) << 16) + (Int64(h[7]) << 8) + Int64(h[8])
    sid = sid & 0x7FFFFFFF
    let payload = Array<UInt8>(len, repeat: 0)
    if (len > 0) {
        if (!hsReadExact(sock, payload)) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    }
    return (true, ftype, flags, sid, payload)
}

func hsNextFrame(ts: TlsSocket): (Bool, UInt8, UInt8, Int64, Array<UInt8>) {
    var fr = (false, 0u8, 0u8, 0, Array<UInt8>(0, repeat: 0))
    try { fr = hsReadFrame(ts) } catch (e: Exception) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    let (ok, t, fl, sid, pl) = fr
    if (ok) {
        if (t == 0x4 && (fl & 0x1) == 0) { ts.write(hsFrame(0x4, 0x1, 0, Array<UInt8>(0, repeat: 0))) }
        if (t == 0x6 && (fl & 0x1) == 0) { ts.write(hsFrame(0x6, 0x1, 0, pl)) }
    }
    return fr
}

func hsConnect(port: Int64): TlsSocket {
    let tcp = TcpSocket("127.0.0.1", UInt16(port))
    tcp.connect()
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    ccfg.supportedAlpnProtocols = ["h2"]
    let ts = TlsSocket.client(tcp, clientConfig: ccfg)
    ts.handshake()
    ts.readTimeout = Duration.second * 3
    ts.write("PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray())
    ts.write(hsFrame(0x4, 0, 0, Array<UInt8>(0, repeat: 0)))
    var g = 0
    while (g < 10) {
        g += 1
        let (ok, t, fl, sid, pl) = hsNextFrame(ts)
        if (!ok) { break }
        if (t == 0x4) { break }
    }
    return ts
}

func hsGetAndRespond(ts: TlsSocket, port: Int64, path: String): Bool {
    ts.write(hsFrame(0x1, 0x5, 1, hsHpackReq(port, path)))
    var gotResp = false
    var g = 0
    while (!gotResp && g < 15) {
        g += 1
        let (ok, t, fl, sid, _) = hsNextFrame(ts)
        if (!ok) { break }
        if (t == 0x0 && (fl & 0x1) != 0) { gotResp = true }
    }
    return gotResp
}

func hsClassify(ts: TlsSocket): String {
    let sawRst = AtomicBool(false)
    let sawGoaway = AtomicBool(false)
    let rstCode = AtomicInt64(-1)
    var closed = false
    var g = 0
    while (g < 20) {
        g += 1
        var fr = (false, 0u8, 0u8, 0, Array<UInt8>(0, repeat: 0))
        var alive = false
        var dead = false
        try {
            fr = hsReadFrame(ts)
        } catch (e: Exception) {
            if (e.message.contains("timeout")) {
                alive = true
            } else {
                dead = true
            }
        }
        if (alive) { break }
        if (dead) { closed = true; break }
        let (ok, t, fl, sid, pl) = fr
        if (!ok) { closed = true; break }
        if (t == 0x4 && (fl & 0x1) == 0) { ts.write(hsFrame(0x4, 0x1, 0, Array<UInt8>(0, repeat: 0))) }
        if (t == 0x6 && (fl & 0x1) == 0) { ts.write(hsFrame(0x6, 0x1, 0, pl)) }
        if (t == 0x3) {
            sawRst.store(true)
            if (pl.size == 4) {
                rstCode.store((Int64(pl[0]) << 24) + (Int64(pl[1]) << 16) + (Int64(pl[2]) << 8) + Int64(pl[3]))
            }
        }
        if (t == 0x7) { sawGoaway.store(true) }
        if (sawRst.load() || sawGoaway.load()) { break }
    }
    try { ts.close() } catch (e: Exception) { () }
    if (sawGoaway.load()) { return "GOAWAY" }
    if (sawRst.load()) { return "RST(code=${rstCode.load()})" }
    if (closed) { return "CLOSED-NO-GOAWAY" }
    return "STILL-OPEN"
}

func hsStartServer(maxStreams: UInt32): (Server, Int64) {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(hsPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(hsPem("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["h2"]
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg)
        .maxConcurrentStreams(maxStreams).build()
    s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return (s, Int64(s.port))
}

@Test
class HsH2ServerStreamState {
    @TestCase
    func headersOnClosedStreamMustBeRejected(): Unit {
        let (s, port) = hsStartServer(100)
        let ts = hsConnect(port)
        let _ = hsGetAndRespond(ts, port, "/")
        ts.write(hsFrame(0x1, 0x5, 1, hsHpackReq(port, "/again")))
        let r = hsClassify(ts)
        println("[hs55-V1] HEADERS on closed stream => ${r}")
        s.close()
        @Expect(r.contains("RST") || r.contains("GOAWAY"), true)
    }

    @TestCase
    func dataOnHalfClosedRemoteMustBeRejected(): Unit {
        let (s, port) = hsStartServer(100)
        let ts = hsConnect(port)
        let _ = hsGetAndRespond(ts, port, "/")
        ts.write(hsFrame(0x0, 0x1, 1, Array<UInt8>(4, repeat: 0x42)))
        let r = hsClassify(ts)
        println("[hs55-V2] DATA on half-closed(remote) => ${r}")
        s.close()
        @Expect(r.contains("RST") || r.contains("GOAWAY"), true)
    }

    @TestCase
    func headersAfterRstMustBeRejected(): Unit {
        let (s, port) = hsStartServer(100)
        let ts = hsConnect(port)
        let _ = hsGetAndRespond(ts, port, "/")
        ts.write(hsFrame(0x3, 0, 1, Array<UInt8>(4, repeat: 0x08)))
        ts.write(hsFrame(0x1, 0x5, 1, hsHpackReq(port, "/again")))
        let r = hsClassify(ts)
        println("[hs55-V3] HEADERS after RST => ${r}")
        s.close()
        @Expect(r.contains("RST") || r.contains("GOAWAY"), true)
    }

    @TestCase
    func decreasingStreamIdMustTerminateConnection(): Unit {
        let (s, port) = hsStartServer(100)
        let ts = hsConnect(port)
        ts.write(hsFrame(0x1, 0x5, 3, hsHpackReq(port, "/")))
        var gotResp = false
        var g = 0
        while (!gotResp && g < 15) {
            g += 1
            let (ok, t, fl, sid, _) = hsNextFrame(ts)
            if (!ok) { break }
            if (t == 0x0 && (fl & 0x1) != 0) { gotResp = true }
        }
        ts.write(hsFrame(0x1, 0x5, 1, hsHpackReq(port, "/back")))
        let r = hsClassify(ts)
        println("[hs55-V4] decreasing stream id => ${r}")
        s.close()
        @Expect(r.contains("GOAWAY") || r.contains("CLOSED"), true)
    }

    @TestCase
    func streamZeroHeadersTerminatesConnection(): Unit {
        let (s, port) = hsStartServer(100)
        let ts = hsConnect(port)
        ts.write(hsFrame(0x1, 0x5, 0, hsHpackReq(port, "/zero")))
        let r = hsClassify(ts)
        println("[hs55-G1] HEADERS on stream 0 => ${r}")
        s.close()
        @Expect(r.contains("GOAWAY") || r.contains("CLOSED"), true)
    }

    @TestCase
    func evenStreamIdGoawayObservable(): Unit {
        let (s, port) = hsStartServer(100)
        var seen = false
        for (i in 0..15) {
            let ts = hsConnect(port)
            ts.write(hsFrame(0x1, 0x5, 2, hsHpackReq(port, "/even")))
            let r = hsClassify(ts)
            if (r.contains("GOAWAY")) { seen = true; break }
        }
        println("[hs55-G5] even stream id goaway seen=${seen} (<=15 attempts)")
        s.close()
        @Expect(seen, true)
    }

    @TestCase
    func emptyHeadersBlockRst(): Unit {
        let (s, port) = hsStartServer(100)
        let ts = hsConnect(port)
        ts.write(hsFrame(0x1, 0x5, 1, Array<UInt8>(0, repeat: 0)))
        let r = hsClassify(ts)
        println("[hs55-G2] empty HEADERS => ${r}")
        s.close()
        @Expect(r.contains("RST"), true)
    }

    @TestCase
    func overLimitStreamsRefusedWithRst7(): Unit {
        let (s, port) = hsStartServer(3)
        let ts = hsConnect(port)
        for (sid in [1, 3, 5, 7, 9]) {
            ts.write(hsFrame(0x1, 0x5, sid, hsHpackReq(port, "/burst")))
        }
        let r = hsClassify(ts)
        println("[hs55-G3] 5 streams vs limit=3 => ${r}")
        s.close()
        @Expect(r.contains("RST(code=7)"), true)
    }

    @TestCase
    func interleavedMultiStreamBothRespond(): Unit {
        let (s, port) = hsStartServer(100)
        s.distributor.register("/data", { ctx => ctx.responseBuilder.body("data-ok") })
        let ts = hsConnect(port)
        ts.write(hsFrame(0x1, 0x4, 1, hsHpackReq(port, "/data")))
        ts.write(hsFrame(0x1, 0x5, 3, hsHpackReq(port, "/")))
        ts.write(hsFrame(0x0, 0x1, 1, Array<UInt8>(5, repeat: 0x41)))
        let respCount = AtomicInt64(0)
        var g = 0
        while (respCount.load() < 2 && g < 30) {
            g += 1
            let (ok, t, fl, sid, _) = hsNextFrame(ts)
            if (!ok) { break }
            if (t == 0x0 && (fl & 0x1) != 0) { respCount.fetchAdd(1) }
        }
        try { ts.close() } catch (e: Exception) { () }
        println("[hs55-G4] interleaved mux responses=${respCount.load()}")
        s.close()
        @Expect(respCount.load(), 2)
    }
}
