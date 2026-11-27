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

class Counter {
    var responded: Int64 = 0
}

func u8hf(v: Int64): UInt8 { return UInt8(v & 0xFF) }
func iminhf(a: Int64, b: Int64): Int64 { if (a < b) { a } else { b } }

const FT_DATA_HF: UInt8 = 0x0
const FT_HEADERS_HF: UInt8 = 0x1
const FT_SETTINGS_HF: UInt8 = 0x4
const FT_PING_HF: UInt8 = 0x6
const FT_GOAWAY_HF: UInt8 = 0x7
const FT_WU_HF: UInt8 = 0x8

func frameBytesHf(ftype: UInt8, flags: UInt8, sid: Int64, payload: Array<UInt8>): Array<UInt8> {
    let out = Array<UInt8>(9 + payload.size, repeat: 0)
    let l = payload.size
    out[0] = u8hf(l >> 16); out[1] = u8hf(l >> 8); out[2] = u8hf(l)
    out[3] = ftype; out[4] = flags
    let id = sid & 0x7FFFFFFF
    out[5] = u8hf(id >> 24); out[6] = u8hf(id >> 16); out[7] = u8hf(id >> 8); out[8] = u8hf(id)
    for (i in 0..payload.size) { out[9 + i] = payload[i] }
    return out
}

func hpackLitHf(name: String, value: String): ArrayList<UInt8> {
    let out = ArrayList<UInt8>()
    out.add(0x00)
    let n = name.toArray(); let v = value.toArray()
    if (n.size < 127) { out.add(u8hf(n.size)) } else { out.add(0x7F); out.add(u8hf(n.size - 127)) }
    for (b in n) { out.add(b) }
    if (v.size < 127) { out.add(u8hf(v.size)) } else { out.add(0x7F); out.add(u8hf(v.size - 127)) }
    for (b in v) { out.add(b) }
    return out
}

func hpackHeadersHf(pairs: Array<(String, String)>): Array<UInt8> {
    let out = ArrayList<UInt8>()
    for ((k, val) in pairs) {
        for (b in hpackLitHf(k, val)) { out.add(b) }
    }
    return out.toArray()
}

func hpackRespHeadersHf(contentLength: String): Array<UInt8> {
    let out = ArrayList<UInt8>()
    out.add(0x88)
    for (b in hpackLitHf("content-length", contentLength)) { out.add(b) }
    return out.toArray()
}

func settingsPayloadHf(entries: Array<(Int64, Int64)>): Array<UInt8> {
    let out = ArrayList<UInt8>()
    for ((id, v) in entries) {
        out.add(u8hf(id >> 8)); out.add(u8hf(id))
        out.add(u8hf(v >> 24)); out.add(u8hf(v >> 16)); out.add(u8hf(v >> 8)); out.add(u8hf(v))
    }
    return out.toArray()
}

func goawayPayloadHf(lastSid: Int64): Array<UInt8> {
    let out = Array<UInt8>(8, repeat: 0)
    let id = lastSid & 0x7FFFFFFF
    out[0] = u8hf(id >> 24); out[1] = u8hf(id >> 16); out[2] = u8hf(id >> 8); out[3] = u8hf(id)
    return out
}

func wuIncHf(pl: Array<UInt8>): Int64 {
    return (Int64(pl[0]) << 24) + (Int64(pl[1]) << 16) + (Int64(pl[2]) << 8) + Int64(pl[3])
}

func intPayloadHf(v: Int64): Array<UInt8> {
    let out = Array<UInt8>(4, repeat: 0)
    out[0] = u8hf(v >> 24); out[1] = u8hf(v >> 16); out[2] = u8hf(v >> 8); out[3] = u8hf(v)
    return out
}

func readExactHf(sock: TlsSocket, buf: Array<UInt8>): Bool {
    var got = 0
    while (got < buf.size) {
        let n = sock.read(buf[got..])
        if (n <= 0) { return false }
        got += n
    }
    return true
}

func h2ReadFrameHf(sock: TlsSocket): (Bool, UInt8, UInt8, Int64, Array<UInt8>) {
    let h = Array<UInt8>(9, repeat: 0)
    if (!readExactHf(sock, h)) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    let len = (Int64(h[0]) << 16) + (Int64(h[1]) << 8) + Int64(h[2])
    let ftype = h[3]
    let flags = h[4]
    var sid = (Int64(h[5]) << 24) + (Int64(h[6]) << 16) + (Int64(h[7]) << 8) + Int64(h[8])
    sid = sid & 0x7FFFFFFF
    let payload = Array<UInt8>(len, repeat: 0)
    if (len > 0) {
        if (!readExactHf(sock, payload)) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    }
    return (true, ftype, flags, sid, payload)
}

func pemHf(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func bodyStrHf(resp: HttpResponse): String {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(8192, repeat: 0)
    while (true) {
        let n = resp.body.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return String.fromUtf8(buffer.toArray())
}

func bigBodyHf(n: Int64): Array<UInt8> {
    let b = Array<UInt8>(n, repeat: 0)
    var i: Int64 = 0
    while (i < n) { b[i] = u8hf(i % 251); i += 1 }
    return b
}

func clientIntegrityHf(resp: HttpResponse, n: Int64): Bool {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(16384, repeat: 0)
    while (true) {
        let k = resp.body.read(chunk)
        if (k == 0) { break }
        for (i in 0..k) { buffer.add(chunk[i]) }
    }
    let got = buffer.toArray()
    if (got.size != n) { return false }
    var i: Int64 = 0
    while (i < n) {
        if (got[i] != u8hf(i % 251)) { return false }
        i += 1
    }
    return true
}

func respondFlowHf(sock: TlsSocket, sid: Int64, body: Array<UInt8>, swInit: Int64): (Bool, Int64) {
    sock.write(frameBytesHf(FT_HEADERS_HF, 0x4, sid, hpackRespHeadersHf("${body.size}")))
    var sw = swInit
    var cw: Int64 = 65535
    var sent = 0
    var wus: Int64 = 0
    while (sent < body.size) {
        let chunk = iminhf(iminhf(16384, body.size - sent), iminhf(sw, cw))
        if (chunk <= 0) {
            var gotWu = false
            while (true) {
                let (ok, ft, fl, s2, pl) = h2ReadFrameHf(sock)
                if (!ok) { return (false, wus) }
                if (ft == FT_WU_HF) {
                    let inc = wuIncHf(pl)
                    if (s2 == 0) { cw += inc } else { if (s2 == sid) { sw += inc } }
                    wus += 1
                    gotWu = true
                    break
                }
                if (ft == FT_PING_HF && (fl & 0x1) == 0) {
                    sock.write(frameBytesHf(FT_PING_HF, 0x1, 0, pl))
                }
                if (ft == FT_SETTINGS_HF && (fl & 0x1) == 0) {
                    sock.write(frameBytesHf(FT_SETTINGS_HF, 0x1, 0, Array<UInt8>(0, repeat: 0)))
                }
                if (ft == 0x3) {
                    println("[respondFlow] RST received while sending")
                    return (false, wus)
                }
            }
            if (!gotWu) { continue }
        }
        let payload = Array<UInt8>(chunk, repeat: 0)
        var i2 = 0
        while (i2 < chunk) { payload[i2] = body[sent + i2]; i2 += 1 }
        let last = (sent + chunk) >= body.size
        let fl: UInt8 = if (last) { 0x1 } else { 0x0 }
        sock.write(frameBytesHf(FT_DATA_HF, fl, sid, payload))
        sent += chunk
        sw -= chunk
        cw -= chunk
    }
    return (true, wus)
}

func startH2FrameServer(mode: String): (TcpServerSocket, Int64, AtomicBool, AtomicInt64) {
    let reuseFlag = AtomicBool(false)
    let observe = AtomicInt64(0)
    let accepts = AtomicInt64(0)
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
            var ts: ?TlsSocket = None<TlsSocket>
            try {
                let tcp = listener.accept()
                var cfg = TlsServerConfig(X509Certificate.decodeFromPem(pemHf("end_rsa.cer")),
                    GeneralPrivateKey.decodeFromPem(pemHf("end_rsa_private_key.pem")))
                cfg.supportedAlpnProtocols = ["h2"]
                let sock = TlsSocket.server(tcp, serverConfig: cfg)
                let hr = sock.handshake()
                let pre = Array<UInt8>(24, repeat: 0)
                if (!readExactHf(sock, pre)) { try { sock.close() } catch (x: Exception) { () }; continue }
                let (ok, t, fl, _, pl) = h2ReadFrameHf(sock)
                if (!ok || t != FT_SETTINGS_HF) { try { sock.close() } catch (x: Exception) { () }; continue }
                sock.write(frameBytesHf(FT_SETTINGS_HF, 0, 0, Array<UInt8>(0, repeat: 0)))
                sock.write(frameBytesHf(FT_SETTINGS_HF, 0x1, 0, Array<UInt8>(0, repeat: 0)))
                ts = Some(sock)
            } catch (e: Exception) { return }
            match (ts) {
                case Some(sock) =>
                    if (accepts.fetchAdd(1) + 1 == 1) {
                        try {
                            var goawaySent = false
                            var rstSent = false
                            var pingSent = false
                            var uploaded: Int64 = 0
                            var connDone = (mode == "rst-drain")
                            if (mode == "rst-drain") {
                                let (okh, _, _, sidH, _) = h2ReadFrameHf(sock)
                                if (okh && sidH != 0) {
                                    sock.write(frameBytesHf(FT_HEADERS_HF, 0x4, sidH, hpackRespHeadersHf("100")))
                                    sock.write(frameBytesHf(FT_DATA_HF, 0x0, sidH, Array<UInt8>(10, repeat: 0x44)))
                                    sock.write(frameBytesHf(0x3, 0, sidH, intPayloadHf(2)))
                                }
                                let b2 = Array<UInt8>(4096, repeat: 0)
                                while (true) {
                                    var n = 0
                                    var err = false
                                    try { n = sock.read(b2) } catch (e: Exception) { err = true }
                                    if (err || n <= 0) { break }
                                }
                            }
                            while (!connDone) {
                                let (ok, ft, fl, sid, pl) = h2ReadFrameHf(sock)
                                if (!ok) { break }
                                if (ft == FT_SETTINGS_HF && (fl & 0x1) == 0) {
                                    sock.write(frameBytesHf(FT_SETTINGS_HF, 0x1, 0, Array<UInt8>(0, repeat: 0)))
                                }
                                if (ft == FT_PING_HF && (fl & 0x1) == 0) {
                                    sock.write(frameBytesHf(FT_PING_HF, 0x1, 0, pl))
                                }
                                if (ft == FT_DATA_HF && mode == "upload") {
                                    uploaded += pl.size
                                    if ((fl & 0x1) != 0) {
                                        let echoText = "echo-${uploaded}"
                                        sock.write(frameBytesHf(FT_HEADERS_HF, 0x4, sid, hpackRespHeadersHf("${echoText.size}")))
                                        sock.write(frameBytesHf(FT_DATA_HF, 0x1, sid, echoText.toArray()))
                                    }
                                }
                                if (ft == FT_HEADERS_HF) {
                                    if (mode == "goaway") {
                                        if (!goawaySent) {
                                            sock.write(frameBytesHf(FT_HEADERS_HF, 0x4, sid, hpackRespHeadersHf("5")))
                                            sock.write(frameBytesHf(FT_DATA_HF, 0x1, sid, Array<UInt8>(5, repeat: 0x42)))
                                            sleep(Duration.millisecond * 100)
                                            sock.write(frameBytesHf(FT_GOAWAY_HF, 0, 0, goawayPayloadHf(sid)))
                                            goawaySent = true
                                        } else {
                                            reuseFlag.store(true)
                                            sock.write(frameBytesHf(FT_HEADERS_HF, 0x4, sid, hpackRespHeadersHf("5")))
                                            sock.write(frameBytesHf(FT_DATA_HF, 0x1, sid, Array<UInt8>(5, repeat: 0x45)))
                                        }
                                    } else {
                                        if (mode == "ping") {
                                            if (!pingSent) {
                                                let (done, _) = respondFlowHf(sock, sid, Array<UInt8>(5, repeat: 0x41), 65535)
                                                sock.write(frameBytesHf(FT_PING_HF, 0, 0, "abcdefgh".toArray()))
                                                pingSent = true
                                            } else {
                                                sock.write(frameBytesHf(FT_HEADERS_HF, 0x4, sid, hpackRespHeadersHf("5")))
                                                sock.write(frameBytesHf(FT_DATA_HF, 0x1, sid, Array<UInt8>(5, repeat: 0x45)))
                                            }
                                        } else {
                                            if (mode == "flow") {
                                                if (observe.load() == 0) {
                                                    sock.write(frameBytesHf(FT_SETTINGS_HF, 0, 0, settingsPayloadHf([(0x4, 10)])))
                                                    sleep(Duration.millisecond * 100)
                                                    let (done, wus) = respondFlowHf(sock, sid, bigBodyHf(1000), 10)
                                                    observe.store(if (done) { 1000 + wus } else { -1 })
                                                } else {
                                                    sock.write(frameBytesHf(FT_HEADERS_HF, 0x4, sid, hpackRespHeadersHf("5")))
                                                    sock.write(frameBytesHf(FT_DATA_HF, 0x1, sid, Array<UInt8>(5, repeat: 0x45)))
                                                }
                                                } else {
                                                    if (mode == "rst") {
                                                        if (!rstSent) {
                                                            sock.write(frameBytesHf(FT_HEADERS_HF, 0x4, sid, hpackRespHeadersHf("100")))
                                                            sock.write(frameBytesHf(FT_DATA_HF, 0x0, sid, Array<UInt8>(10, repeat: 0x44)))
                                                            sleep(Duration.millisecond * 50)
                                                            sock.write(frameBytesHf(0x3, 0, sid, intPayloadHf(2)))
                                                            rstSent = true
                                                        } else {
                                                            sock.write(frameBytesHf(FT_HEADERS_HF, 0x4, sid, hpackRespHeadersHf("5")))
                                                            sock.write(frameBytesHf(FT_DATA_HF, 0x1, sid, Array<UInt8>(5, repeat: 0x45)))
                                                            observe.store(1)
                                                        }
                                                    } else {
                                                        if (mode == "upload") {
                                                        } else {
                                                            if (mode == "large") {
                                                            if (observe.load() == 0) {
                                                                let (done, wus) = respondFlowHf(sock, sid, bigBodyHf(204800), 65535)
                                                                observe.store(if (done) { 204800 + wus } else { -1 })
                                                            } else {
                                                                sock.write(frameBytesHf(FT_HEADERS_HF, 0x4, sid, hpackRespHeadersHf("5")))
                                                                sock.write(frameBytesHf(FT_DATA_HF, 0x1, sid, Array<UInt8>(5, repeat: 0x45)))
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } catch (e: Exception) { () }
                        try { sock.close() } catch (x: Exception) { () }
                    } else {
                        try {
                            while (true) {
                                let (ok, ft, fl, sid, pl) = h2ReadFrameHf(sock)
                                if (!ok) { break }
                                if (ft == FT_SETTINGS_HF && (fl & 0x1) == 0) {
                                    sock.write(frameBytesHf(FT_SETTINGS_HF, 0x1, 0, Array<UInt8>(0, repeat: 0)))
                                }
                                if (ft == FT_PING_HF && (fl & 0x1) == 0) {
                                    sock.write(frameBytesHf(FT_PING_HF, 0x1, 0, pl))
                                }
                                if (ft == FT_HEADERS_HF) {
                                    sock.write(frameBytesHf(FT_HEADERS_HF, 0x4, sid, hpackRespHeadersHf("5")))
                                    sock.write(frameBytesHf(FT_DATA_HF, 0x1, sid, Array<UInt8>(5, repeat: 0x45)))
                                }
                            }
                        } catch (e: Exception) { () }
                        try { sock.close() } catch (x: Exception) { () }
                    }
                case None => return
            }
        }
    }
    sleep(Duration.millisecond * 150)
    return (listener, port, reuseFlag, observe)
}

func h2FrameClient(): Client {
    var cfg = TlsClientConfig()
    cfg.verifyMode = TrustAll
    cfg.supportedAlpnProtocols = ["h2"]
    return ClientBuilder().tlsConfig(cfg).readTimeout(6 * Duration.second).build()
}

@Test
class HuntH2ClientFrames {
    @TestCase
    func clientMustNotOpenStreamsAfterGoaway(): Unit {
        let (listener, port, reused, _) = startH2FrameServer("goaway")
        let c = h2FrameClient()
        let r1 = c.get("https://127.0.0.1:${port}/p2a")
        let r2 = c.get("https://127.0.0.1:${port}/p2b")
        println("[GOAWAY] req1=${r1.status} req2=${r2.status} reused=${reused.load()}")
        @Expect(reused.load(), false)
        c.close()
        listener.close()
    }

    @TestCase
    func clientPongOnServerPing(): Unit {
        let (listener, port, _, observe) = startH2FrameServer("ping")
        let c = h2FrameClient()
        let r1 = c.get("https://127.0.0.1:${port}/p1")
        let r2 = c.get("https://127.0.0.1:${port}/p1b")
        let observed = observe.load()
        println("[PING] req1=${r1.status} req2=${r2.status} observed=${observed}")
        @Expect(r1.status, 200)
        @Expect(r2.status, 200)
        c.close()
        listener.close()
    }

    @TestCase
    func flowControlSmallWindowIntegrity(): Unit {
        let (listener, port, _, observe) = startH2FrameServer("flow")
        let c = h2FrameClient()
        let r = c.get("https://127.0.0.1:${port}/p4")
        let okBody = clientIntegrityHf(r, 1000)
        let observed = observe.load()
        println("[FLOW] status=${r.status} integrity=${okBody} serverObserved=${observed}")
        @Expect(r.status, 200)
        @Expect(okBody, true)
        @Expect(observed > 1000, true)
        c.close()
        listener.close()
    }

    @TestCase
    func largeResponseIntegrity200k(): Unit {
        let (listener, port, _, observe) = startH2FrameServer("large")
        let c = h2FrameClient()
        let r = c.get("https://127.0.0.1:${port}/p6")
        let okBody = clientIntegrityHf(r, 204800)
        let observed = observe.load()
        println("[LARGE] status=${r.status} integrity=${okBody} serverObserved=${observed}")
        @Expect(r.status, 200)
        @Expect(okBody, true)
        @Expect(observed > 204800, true)
        c.close()
        listener.close()
    }

    @TestCase
    func rstMidResponseCleanErrorHealthyConn(): Unit {
        let (listener, port, _, observe) = startH2FrameServer("rst")
        let c = h2FrameClient()
        var req1 = "ok"
        try {
            let r = c.get("https://127.0.0.1:${port}/p5")
            req1 = "${r.status}"
        } catch (e: Exception) {
            req1 = "EXC: ${e}"
        }
        let r2 = c.get("https://127.0.0.1:${port}/p5b")
        let reused = observe.load()
        println("[RST] req1=${req1} req2=${r2.status} secondStreamServedOnConn1=${reused}")
        @Expect(r2.status, 200)
        c.close()
        listener.close()
    }

    @TestCase
    func upload10kCompletes(): Unit {
        let (listener, port, _, _) = startH2FrameServer("upload")
        let c = h2FrameClient()
        let bigText = String.fromUtf8(Array<UInt8>(10240, repeat: 0x61))
        var respBody = "?"
        try {
            let r = c.send(HttpRequestBuilder().method("POST")
                .url("https://127.0.0.1:${port}/echo").body(bigText).build())
            respBody = bodyStrHf(r)
        } catch (e: Exception) {
            respBody = "EXC: ${e}"
        }
        println("[UPLOAD] body=[${respBody}]")
        @Expect(respBody, "echo-10240")
        c.close()
        listener.close()
    }
    @TestCase
    func h2TwoHundredStreamsRace(): Unit {
        var cfg = TlsServerConfig(X509Certificate.decodeFromPem(pemHf("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(pemHf("end_rsa_private_key.pem")))
        cfg.supportedAlpnProtocols = ["h2"]
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        server.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
        let port = Int64(server.port)
        let tcp = TcpSocket("127.0.0.1", UInt16(port))
        tcp.connect()
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        ccfg.supportedAlpnProtocols = ["h2"]
        let ts = TlsSocket.client(tcp, clientConfig: ccfg)
        let hr = ts.handshake()
        ts.write("PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray())
        ts.write(frameBytesHf(0x4, 0, 0, Array<UInt8>(0, repeat: 0)))
        let getHdr = hpackHeadersHf([(":method", "GET"), (":scheme", "https"),
            (":path", "/"), (":authority", "127.0.0.1:${port}")])
        var out = ArrayList<UInt8>()
        var s: Int64 = 1
        var i: Int64 = 0
        while (i < 200) {
            for (b in frameBytesHf(0x1, 0x5, s, getHdr)) { out.add(b) }
            s += 2
            i += 1
        }
        ts.write(out.toArray())
        let counter = Counter()
        let done = AtomicBool(false)
        spawn {
            while (!done.load()) {
                let (ok, ft, fl, sid, pl) = h2ReadFrameHf(ts)
                if (!ok) { break }
                if (ft == 0x0 && (fl & 0x1) != 0) { counter.responded += 1 }
            }
        }
        var w: Int64 = 0
        while (counter.responded < 200 && w < 6000) { sleep(Duration.millisecond * 50); w += 50 }
        done.store(true)
        try { ts.close() } catch (e: Exception) { () }
        tcp.close()
        server.close()
        println("[RACE-200] responded=${counter.responded}/200")
        @Expect(counter.responded, 200)
    }

    @TestCase
    func h2DataHugeDeclaredLegalWait(): Unit {
        var cfg = TlsServerConfig(X509Certificate.decodeFromPem(pemHf("end_rsa.cer")),
            GeneralPrivateKey.decodeFromPem(pemHf("end_rsa_private_key.pem")))
        cfg.supportedAlpnProtocols = ["h2"]
        let server = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
        server.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
        let port = Int64(server.port)
        let tcp = TcpSocket("127.0.0.1", UInt16(port))
        tcp.connect()
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        ccfg.supportedAlpnProtocols = ["h2"]
        let ts = TlsSocket.client(tcp, clientConfig: ccfg)
        let hr = ts.handshake()
        ts.write("PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray())
        ts.write(frameBytesHf(0x4, 0, 0, Array<UInt8>(0, repeat: 0)))
        let hdr = hpackHeadersHf([(":method", "POST"), (":scheme", "https"),
            (":path", "/p"), (":authority", "127.0.0.1:${port}")])
        ts.write(frameBytesHf(0x1, 0x0, 1, hdr))
        var dataDecl = ArrayList<UInt8>()
        dataDecl.add(0xFF); dataDecl.add(0xFF); dataDecl.add(0xFF)
        dataDecl.add(0x0); dataDecl.add(0x0)
        dataDecl.add(0x00); dataDecl.add(0x00); dataDecl.add(0x00); dataDecl.add(0x01)
        for (i in 0..8) { dataDecl.add(0x41) }
        ts.write(dataDecl.toArray())
        sleep(Duration.millisecond * 2000)
        try { ts.close() } catch (e: Exception) { () }
        tcp.close()
        let c2 = h2FrameClient()
        var r2ok = "?"
        try {
            let r2 = c2.get("https://127.0.0.1:${port}/")
            r2ok = "${r2.status}"
        } catch (e: Exception) {
            r2ok = "EXC: ${e}"
        }
        c2.close()
        server.close()
        println("[HUGE-DECL] fresh-conn GET after abandoned huge DATA: ${r2ok}")
        @Expect(r2ok, "200")
    }
    @TestCase
    func rstStreamSurfacedWhenPeerSilent(): Unit {
        let (listener, port, _, _) = startH2FrameServer("rst-drain")
        let c = h2FrameClient()
        let t0 = DateTime.now()
        var outcome = "ok"
        try {
            let r = c.get("https://127.0.0.1:${port}/rst")
            let buffer = ArrayList<UInt8>()
            let chunk = Array<UInt8>(8192, repeat: 0)
            while (true) {
                let n = r.body.read(chunk)
                if (n <= 0) { break }
                for (k in 0..n) { buffer.add(chunk[k]) }
            }
            outcome = "200 bodyBytes=${buffer.size}"
        } catch (e: Exception) {
            let ms = (DateTime.now() - t0).toMilliseconds()
            outcome = "EXC(${ms}ms): ${e}"
        }
        let ms = (DateTime.now() - t0).toMilliseconds()
        c.close()
        listener.close()
        println("[RST-DRAIN] outcome=${outcome} elapsed=${ms}ms")
        @Expect(ms < 2000, true)
    }
}
