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

func nePem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func neServerTls(): TlsServerConfig {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(nePem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(nePem("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["h2"]
    return cfg
}

func neU8(v: Int64): UInt8 { return UInt8(v & 0xFF) }

func neFrame(ftype: UInt8, flags: UInt8, sid: Int64, payload: Array<UInt8>): Array<UInt8> {
    let out = Array<UInt8>(9 + payload.size, repeat: 0)
    let l = payload.size
    out[0] = neU8(l >> 16); out[1] = neU8(l >> 8); out[2] = neU8(l)
    out[3] = ftype; out[4] = flags
    let id = sid & 0x7FFFFFFF
    out[5] = neU8(id >> 24); out[6] = neU8(id >> 16); out[7] = neU8(id >> 8); out[8] = neU8(id)
    for (i in 0..payload.size) { out[9 + i] = payload[i] }
    return out
}

func neLit(name: String, value: String): ArrayList<UInt8> {
    let out = ArrayList<UInt8>()
    out.add(0x00)
    let n = name.toArray(); let vb = value.toArray()
    out.add(neU8(n.size))
    for (b in n) { out.add(b) }
    out.add(neU8(vb.size))
    for (b in vb) { out.add(b) }
    return out
}

func neHpackGet(port: Int64, path: String): Array<UInt8> {
    let out = ArrayList<UInt8>()
    out.add(0x82)
    out.add(0x87)
    for (b in neLit(":path", path)) { out.add(b) }
    for (b in neLit(":authority", "127.0.0.1:${port}")) { out.add(b) }
    return out.toArray()
}

func neHpackPost(port: Int64, path: String): Array<UInt8> {
    let out = ArrayList<UInt8>()
    out.add(0x83)
    out.add(0x87)
    for (b in neLit(":path", path)) { out.add(b) }
    for (b in neLit(":authority", "127.0.0.1:${port}")) { out.add(b) }
    return out.toArray()
}

func neWuPayload(inc: Int64): Array<UInt8> {
    let w = Array<UInt8>(4, repeat: 0)
    w[0] = neU8(inc >> 24); w[1] = neU8(inc >> 16); w[2] = neU8(inc >> 8); w[3] = neU8(inc)
    return w
}

func neReadExact(sock: TlsSocket, buf: Array<UInt8>): Bool {
    var got = 0
    while (got < buf.size) {
        let n = sock.read(buf[got..])
        if (n <= 0) { return false }
        got += n
    }
    return true
}

func neReadFrame(sock: TlsSocket): (Bool, UInt8, UInt8, Int64, Array<UInt8>) {
    let h = Array<UInt8>(9, repeat: 0)
    if (!neReadExact(sock, h)) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    let len = (Int64(h[0]) << 16) + (Int64(h[1]) << 8) + Int64(h[2])
    var sid = (Int64(h[5]) << 24) + (Int64(h[6]) << 16) + (Int64(h[7]) << 8) + Int64(h[8])
    sid = sid & 0x7FFFFFFF
    let payload = Array<UInt8>(len, repeat: 0)
    if (len > 0) {
        if (!neReadExact(sock, payload)) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    }
    return (true, h[3], h[4], sid, payload)
}

func neNext(ts: TlsSocket): (Bool, UInt8, UInt8, Int64, Array<UInt8>) {
    var fr = (false, 0u8, 0u8, 0, Array<UInt8>(0, repeat: 0))
    try { fr = neReadFrame(ts) } catch (e: Exception) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    let (ok, t, fl, sid, pl) = fr
    if (ok) {
        if (t == 0x4 && (fl & 0x1) == 0) { ts.write(neFrame(0x4, 0x1, 0, Array<UInt8>(0, repeat: 0))) }
        if (t == 0x6 && (fl & 0x1) == 0) { ts.write(neFrame(0x6, 0x1, 0, pl)) }
    }
    return fr
}

func neConnect(port: Int64): TlsSocket {
    let tcp = TcpSocket("127.0.0.1", UInt16(port))
    tcp.connect()
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    ccfg.supportedAlpnProtocols = ["h2"]
    let ts = TlsSocket.client(tcp, clientConfig: ccfg)
    ts.handshake()
    ts.readTimeout = Duration.second * 2
    ts.write("PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray())
    ts.write(neFrame(0x4, 0, 0, Array<UInt8>(0, repeat: 0)))
    var g = 0
    while (g < 10) {
        g += 1
        let (ok, t, fl, sid, pl) = neNext(ts)
        if (!ok) { break }
        if (t == 0x4) { break }
    }
    return ts
}

func neStartServer(maxStreams: UInt32): (Server, Int64) {
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(neServerTls())
        .maxConcurrentStreams(maxStreams).build()
    s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
    s.distributor.register("/data", { ctx => ctx.responseBuilder.body("data-ok") })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return (s, Int64(s.port))
}

func neAwaitResponses(ts: TlsSocket, want: Int64, maxMs: Int64): Int64 {
    let done = AtomicBool(false)
    let readerDone = AtomicBool(false)
    let count = AtomicInt64(0)
    spawn {
        while (!done.load() && count.load() < want) {
            let (ok, t, fl, sid, pl) = neNext(ts)
            if (!ok) { break }
            if (t == 0x0 && (fl & 0x1) != 0) { count.fetchAdd(1) }
            if (t == 0x7) { count.store(-1); break }
        }
        readerDone.store(true)
    }
    var waited: Int64 = 0
    while (count.load() < want && count.load() >= 0 && waited < maxMs) {
        sleep(Duration.millisecond * 50)
        waited += 50
    }
    done.store(true)
    var w = 0
    while (!readerDone.load() && w < 2600) {
        sleep(Duration.millisecond * 50)
        w += 50
    }
    return count.load()
}

@Test
class NettyH2Edges {
    // GREEN: PRIORITY frames on idle streams (dependency tree) — legal, service continues
    @TestCase
    func priorityTreeOnIdleStreams(): Unit {
        let (s, port) = neStartServer(100)
        let ts = neConnect(port)
        let pri1 = Array<UInt8>(5, repeat: 0x00)
        pri1[3] = 0x10
        ts.write(neFrame(0x2, 0, 1, pri1))
        let pri3 = Array<UInt8>(5, repeat: 0x00)
        pri3[2] = 0x01
        pri3[4] = 0x20
        ts.write(neFrame(0x2, 0, 3, pri3))
        ts.write(neFrame(0x1, 0x5, 1, neHpackGet(port, "/")))
        ts.write(neFrame(0x1, 0x5, 3, neHpackGet(port, "/")))
        let got = neAwaitResponses(ts, 2, 3000)
        try { ts.close() } catch (e: Exception) { () }
        s.close()
        println("[ne-N1] priority-tree => responses=${got}")
        @Expect(got, 2)
    }

    // GREEN: PADDED HEADERS and PADDED DATA are stripped and served normally
    @TestCase
    func paddedHeadersAndDataStripped(): Unit {
        let (s, port) = neStartServer(100)
        let ts = neConnect(port)
        let hpack = neHpackGet(port, "/")
        let padded = ArrayList<UInt8>()
        padded.add(8)
        for (b in hpack) { padded.add(b) }
        for (_ in 0..8) { padded.add(0) }
        ts.write(neFrame(0x1, 0xD, 1, padded.toArray()))
        let got = neAwaitResponses(ts, 1, 3000)
        try { ts.close() } catch (e: Exception) { () }
        let ts2 = neConnect(port)
        ts2.write(neFrame(0x1, 0x4, 1, neHpackPost(port, "/data")))
        let dpack = ArrayList<UInt8>()
        dpack.add(4)
        for (b in "ping".toArray()) { dpack.add(b) }
        for (_ in 0..4) { dpack.add(0) }
        ts2.write(neFrame(0x0, 0x9, 1, dpack.toArray()))
        let got2 = neAwaitResponses(ts2, 1, 3000)
        try { ts2.close() } catch (e: Exception) { () }
        s.close()
        println("[ne-N2] padding => paddedHEADERS=${got} paddedDATA=${got2}")
        @Expect(got, 1)
        @Expect(got2, 1)
    }

    // GREEN: SETTINGS adaptation (HEADER_TABLE_SIZE=0, MAX_FRAME_SIZE=16MB, IWS=0)
    //       + delayed WINDOW_UPDATE unlocks blocked DATA
    @TestCase
    func settingsAdaptedWithZeroWindowUnlock(): Unit {
        let (s, port) = neStartServer(100)
        let ts = neConnect(port)
        var st = ArrayList<UInt8>()
        st.add(0x00); st.add(0x01); st.add(0x00); st.add(0x00); st.add(0x00); st.add(0x00)
        st.add(0x00); st.add(0x05); st.add(0x00); st.add(0xFF); st.add(0xFF); st.add(0xFF)
        st.add(0x00); st.add(0x04); st.add(0x00); st.add(0x00); st.add(0x00); st.add(0x00)
        ts.write(neFrame(0x4, 0, 0, st.toArray()))
        ts.write(neFrame(0x1, 0x5, 1, neHpackGet(port, "/")))
        sleep(Duration.millisecond * 800)
        ts.write(neFrame(0x8, 0, 1, neWuPayload(100)))
        let got = neAwaitResponses(ts, 1, 3000)
        try { ts.close() } catch (e: Exception) { () }
        s.close()
        println("[ne-N3] settings+IWS0 => response=${got}")
        @Expect(got, 1)
    }

    // GREEN: unknown SETTINGS identifier must be ignored (RFC 7540 §6.5.3)
    @TestCase
    func unknownSettingIdentifierIgnored(): Unit {
        let (s, port) = neStartServer(100)
        let ts = neConnect(port)
        var st = ArrayList<UInt8>()
        st.add(0x99); st.add(0x00); st.add(0x00); st.add(0x00); st.add(0x00); st.add(0x00)
        ts.write(neFrame(0x4, 0, 0, st.toArray()))
        ts.write(neFrame(0x1, 0x5, 1, neHpackGet(port, "/")))
        let got = neAwaitResponses(ts, 1, 3000)
        try { ts.close() } catch (e: Exception) { () }
        s.close()
        println("[ne-N5] unknown-setting => response=${got}")
        @Expect(got, 1)
    }

    // GREEN: server HEADERS (no END_HEADERS) + CONTINUATION assembly + DATA — stdx client
    @TestCase
    func serverContinuationAssembly(): Unit {
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
                    let sock = TlsSocket.server(tcp, serverConfig: neServerTls())
                    sock.handshake()
                    spawn {
                        try {
                            let pre = Array<UInt8>(24, repeat: 0)
                            if (!neReadExact(sock, pre)) { return }
                            let (ok, t, fl, sid, pl) = neReadFrame(sock)
                            if (!ok || t != 0x4) { return }
                            sock.write(neFrame(0x4, 0, 0, Array<UInt8>(0, repeat: 0)))
                            sock.write(neFrame(0x4, 0x1, 0, Array<UInt8>(0, repeat: 0)))
                            var gotReq = false
                            var g = 0
                            while (!gotReq && g < 30) {
                                g += 1
                                let (ok2, t2, fl2, sid2, pl2) = neReadFrame(sock)
                                if (!ok2) { return }
                                if (t2 == 0x4 && (fl2 & 0x1) == 0) { sock.write(neFrame(0x4, 0x1, 0, Array<UInt8>(0, repeat: 0))) }
                                if (t2 == 0x6 && (fl2 & 0x1) == 0) { sock.write(neFrame(0x6, 0x1, 0, pl2)) }
                                if (t2 == 0x1) { gotReq = true }
                            }
                            var h1 = ArrayList<UInt8>()
                            h1.add(0x88)
                            for (b in neLit("x-part", "one")) { h1.add(b) }
                            sock.write(neFrame(0x1, 0x0, 1, h1.toArray()))
                            var h2 = ArrayList<UInt8>()
                            for (b in neLit("content-length", "2")) { h2.add(b) }
                            sock.write(neFrame(0x9, 0x4, 1, h2.toArray()))
                            sock.write(neFrame(0x0, 0x1, 1, "ok".toArray()))
                        } catch (e: Exception) { println("[ne-N4srv] ${e}") }
                        try { sock.close() } catch (x: Exception) { () }
                    }
                } catch (e: Exception) { return }
            }
        }
        sleep(Duration.millisecond * 150)
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        ccfg.supportedAlpnProtocols = ["h2"]
        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(6 * Duration.second).build()
        var out = ""
        try {
            let resp = c.get("https://127.0.0.1:${port}/")
            let buffer = ArrayList<UInt8>()
            let chunk = Array<UInt8>(8192, repeat: 0)
            while (true) {
                let n = resp.body.read(chunk)
                if (n <= 0) { break }
                for (i in 0..n) { buffer.add(chunk[i]) }
            }
            out = "status=${resp.status} body=[${String.fromUtf8(buffer.toArray())}]"
        } catch (e: Exception) {
            out = "EXC: ${e.message}"
        }
        c.close()
        listener.close()
        println("[ne-N4] server-continuation => ${out}")
        @Expect(out, "status=200 body=[ok]")
    }
}
