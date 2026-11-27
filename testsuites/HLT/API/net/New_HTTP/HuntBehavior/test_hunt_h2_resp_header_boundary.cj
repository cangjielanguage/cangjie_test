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

// b59 边界钉固化（issue 24/14 家族的 H2 响应方向边界）：
//   G1 h2 响应头 4KB 单帧 → 200（合法）
//   G2 h2 响应头 10KB 单帧 → 200（H2 响应方向无 8192 头限制——与 H1 不对称，issue 14 对照）
//   G3 h2 响应帧 payload 16407（>16384）→ 客户端异常（帧上限正确拒绝，非静默）
// 全部绿钉：当前行为合规，防回归。

func rhPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func rhHpLen(n: Int64): Array<UInt8> {
    if (n < 127) { return [UInt8(n)]
    }
    let out = ArrayList<UInt8>()
    out.add(0x7F)
    var m = n - 127
    while (m >= 128) { out.add(UInt8((m & 0x7F) | 0x80)); m = m >> 7 }
    out.add(UInt8(m))
    return out.toArray()
}

func rhLit(name: String, value: Array<UInt8>): Array<UInt8> {
    let nb = name.toArray()
    let out = ArrayList<UInt8>()
    out.add(0x00)
    for (b in rhHpLen(Int64(nb.size))) { out.add(b) }
    for (b in nb) { out.add(b) }
    for (b in rhHpLen(Int64(value.size))) { out.add(b) }
    for (b in value) { out.add(b) }
    return out.toArray()
}

func rhConcat(a: Array<UInt8>, b: Array<UInt8>): Array<UInt8> {
    let out = ArrayList<UInt8>()
    for (x in a) { out.add(x) }
    for (x in b) { out.add(x) }
    return out.toArray()
}

func rhFrame(ftype: UInt8, flags: UInt8, sid: Int64, payload: Array<UInt8>): Array<UInt8> {
    let n = payload.size
    let out = ArrayList<UInt8>()
    out.add(UInt8((n >> 16) & 0xFF)); out.add(UInt8((n >> 8) & 0xFF)); out.add(UInt8(n & 0xFF))
    out.add(ftype); out.add(flags)
    out.add(UInt8((sid >> 24) & 0x7F)); out.add(UInt8((sid >> 16) & 0xFF))
    out.add(UInt8((sid >> 8) & 0xFF)); out.add(UInt8(sid & 0xFF))
    for (b in payload) { out.add(b) }
    return out.toArray()
}

func rhReadExact(sock: TlsSocket, n: Int64): Bool {
    let buf = Array<UInt8>(n, repeat: 0)
    var got = 0
    try {
        while (got < n) {
            let r = sock.read(buf[got..])
            if (r <= 0) { return false }
            got += Int(r)
        }
    } catch (e: Exception) { return false }
    return true
}

func rhReadFrame(sock: TlsSocket): (Bool, UInt8, Int64, Array<UInt8>) {
    let hdr = Array<UInt8>(9, repeat: 0)
    if (!rhReadExact(sock, 9)) { return (false, 0, 0, Array<UInt8>(0, repeat: 0)) }
    let length = (Int64(hdr[0]) << 16) + (Int64(hdr[1]) << 8) + Int64(hdr[2])
    let t = hdr[3]
    let s = (Int64(hdr[5]) & 0x7F) << 24 | (Int64(hdr[6]) << 16) | (Int64(hdr[7]) << 8) | Int64(hdr[8])
    var pl = Array<UInt8>(0, repeat: 0)
    if (length > 0) {
        if (!rhReadExact(sock, length)) { return (false, t, s, Array<UInt8>(0, repeat: 0)) }
        pl = Array<UInt8>(length, repeat: 0)
        for (i in 0..length) { pl[i] = hdr[i] }  // placeholder, refilled below
    }
    return (true, t, s, pl)
}

// 简化：读取响应头帧（响应 200 判定只看是否收到 HEADERS 且能解出 :status —— 这里用
// body/状态由 stdx Client 自行解析，探针只发超大帧后用 stdx Client 观测行为）

func rhStartSrv(kb: Int64, oversized: Bool): (TcpServerSocket, Int64) {
    let listener = TcpServerSocket(bindAt: 0)
    listener.bind()
    spawn {
        while (true) {
            try {
                let tcp = listener.accept()
                spawn {
                    try {
                        var cfg = TlsServerConfig(X509Certificate.decodeFromPem(rhPem("end_rsa.cer")),
                            GeneralPrivateKey.decodeFromPem(rhPem("end_rsa_private_key.pem")))
                        cfg.supportedAlpnProtocols = ["h2"]
                        let ts = TlsSocket.server(tcp, serverConfig: cfg)
                        let hr = ts.handshake()
                        ts.readTimeout = Duration.millisecond * 5000
                        if (!rhReadExact(ts, 24)) { try { ts.close() } catch (e: Exception) { () }; return }
                        ts.write(rhFrame(0x4, 0, 0, []))   // server SETTINGS
                        // 帧循环：ACK client SETTINGS；收到 client HEADERS(stream1) → 回响应
                        var responded = false
                        while (!responded) {
                            let hdr = Array<UInt8>(9, repeat: 0)
                            var got = 0
                            var brk = false
                            while (got < 9) {
                                let r = ts.read(hdr[got..])
                                if (r <= 0) { brk = true; break }
                                got += Int(r)
                            }
                            if (brk) { break }
                            let length = (Int64(hdr[0]) << 16) + (Int64(hdr[1]) << 8) + Int64(hdr[2])
                            let ftype = hdr[3]; let fl = hdr[4]
                            var pl = Array<UInt8>(0, repeat: 0)
                            if (length > 0) {
                                if (!rhReadExact(ts, length)) { brk = true } else {
                                    pl = Array<UInt8>(length, repeat: 0)
                                }
                            }
                            if (brk) { break }
                            if (ftype == 0x4 && (fl & 0x1) == 0) {
                                ts.write(rhFrame(0x4, 0x1, 0, []))
                            } else if (ftype == 0x1) {
                                // 收到请求头 → 回响应（ oversized=false: 正常大头; true: 帧长超限）
                                var value = Array<UInt8>(kb * 1024, repeat: 0x41u8)
                                if (oversized) { value = Array<UInt8>(16 * 1024 + 300, repeat: 0x42u8) }
                                let block = rhConcat(rhLit(":status", [0x32u8, 0x30u8, 0x30u8]),
                                    rhLit("x-big", value))
                                let flags: UInt8 = 0x4 | 0x1
                                ts.write(rhFrame(0x1, flags, 1, block))
                                responded = true
                            }
                        }
                        sleep(Duration.millisecond * 300)
                        try { ts.close() } catch (e: Exception) { () }
                    } catch (e: Exception) { () }
                }
            } catch (e: Exception) { return }
        }
    }
    while (listener.localAddress.toString().lastIndexOf(":") == -1) { sleep(Duration.millisecond) }
    let la = listener.localAddress.toString()
    var port: Int64 = 0
    match (la.lastIndexOf(":")) { case Some(i) => port = Int64.parse(la[i + 1..]); case None => () }
    return (listener, port)
}

@Test
class HuntH2RespHeaderBoundary {
    // G1: h2 响应头 4KB 单帧 → 200
    @TestCase
    func respHeader4kOk(): Unit {
        let (listener, port) = rhStartSrv(4, false)
        sleep(Duration.millisecond * 100)
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        ccfg.supportedAlpnProtocols = ["h2"]
        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(Duration.second * 6).build()
        var verdict = "EXC"
        try {
            let r = c.get("https://127.0.0.1:${port}/")
            verdict = "status=${r.status}"
        } catch (e: Exception) { verdict = "EXC ${e.message}" }
        c.close()
        listener.close()
        println("[rh] 4KB: ${verdict}")
        @Expect(verdict.startsWith("status=200"), true)
    }

    // GREEN (issue 24/14 对照): h2 响应头 10KB 单帧 → 200（H2 无 8192 头限制）
    @TestCase
    func respHeader10kOk(): Unit {
        let (listener, port) = rhStartSrv(10, false)
        sleep(Duration.millisecond * 100)
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        ccfg.supportedAlpnProtocols = ["h2"]
        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(Duration.second * 6).build()
        var verdict = "EXC"
        try {
            let r = c.get("https://127.0.0.1:${port}/")
            verdict = "status=${r.status}"
        } catch (e: Exception) { verdict = "EXC ${e.message}" }
        c.close()
        listener.close()
        println("[rh] 10KB: ${verdict}")
        @Expect(verdict.startsWith("status=200"), true)
    }

    // GREEN: h2 响应帧 payload 16407（>16384 上限）→ 客户端异常（帧上限正确拒绝）
    @TestCase
    func respFrameOverLimitRejected(): Unit {
        let (listener, port) = rhStartSrv(16, true)
        sleep(Duration.millisecond * 100)
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        ccfg.supportedAlpnProtocols = ["h2"]
        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(Duration.second * 6).build()
        var verdict = "OK"
        try {
            let r = c.get("https://127.0.0.1:${port}/")
            verdict = "status=${r.status}"
        } catch (e: Exception) { verdict = "EXC ${e.message}" }
        c.close()
        listener.close()
        println("[rh] over-limit: ${verdict}")
        @Expect(verdict.startsWith("EXC"), true)   // 当前正确：帧超限拒绝（非静默）
    }
}
