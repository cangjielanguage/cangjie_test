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

// issue 66: TLS1.3 key_share entries for groups the server does not support MUST be
// ignored (RFC 8446 §4.2.8) and usable shares selected; when no usable share exists
// but supported_groups contains a negotiable group, server MUST send HelloRetryRequest
// (§4.1.2). Currently stdx aborts with illegal_parameter alert.
// Raw-ClientHello probes (byte crafting over raw TCP, no TLS API involvement):
//   RED keyshareUnknownEntriesIgnored — groups=[x25519], shares=[x25519, 0x11ec, 0x0100]
//       → expect ServerHello; currently ALERT illegal_parameter
//   RED keyshareOnlyUnknownGroupHrr — groups=[x25519], shares=[0x0999 only]
//       → expect HRR/ServerHello; currently ALERT illegal_parameter
//   GREEN baselineValidShareNegotiates — groups=[x25519], shares=[x25519] → ServerHello

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

func ksPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func ksHexVal(c: UInt8): UInt8 {
    if (c >= 97u8) { return c - 87u8 }
    return c - 48u8
}

func ksHexToBytes(hex: String): Array<UInt8> {
    let out = ArrayList<UInt8>()
    let chars = hex.toArray()
    var i = 0
    while (i + 1 < chars.size) {
        out.add(ksHexVal(chars[i]) * 16u8 + ksHexVal(chars[i + 1]))
        i += 2
    }
    return out.toArray()
}

func ksConcat(a: Array<UInt8>, b: Array<UInt8>): Array<UInt8> {
    let out = ArrayList<UInt8>()
    for (x in a) { out.add(x) }
    for (x in b) { out.add(x) }
    return out.toArray()
}

func ksU16Bytes(v: UInt16): Array<UInt8> {
    return [UInt8(v >> 8), UInt8(v & 0xFF)]
}

func ksExt(t: UInt16, d: Array<UInt8>): ArrayList<UInt8> {
    let out = ArrayList<UInt8>()
    for (b in ksU16Bytes(t)) { out.add(b) }
    for (b in ksU16Bytes(UInt16(d.size))) { out.add(b) }
    for (b in d) { out.add(b) }
    return out
}

func ksMakeKses(entries: Array<(UInt16, Array<UInt8>)>): ArrayList<(UInt16, Array<UInt8>)> {
    let l = ArrayList<(UInt16, Array<UInt8>)>()
    for (e in entries) { l.add(e) }
    return l
}

func ksJoin(parts: ArrayList<ArrayList<UInt8>>): Array<UInt8> {
    let out = ArrayList<UInt8>()
    for (p in parts) { for (b in p) { out.add(b) } }
    return out.toArray()
}

// minimal TLS1.3 ClientHello: sid 32B random, cipher 1301, sv/groups/key_share/sigalgs
func ksBuildCh(groups: Array<UInt16>, kses: ArrayList<(UInt16, Array<UInt8>)>): Array<UInt8> {
    let sid = ksHexToBytes("db08bfc01b03fc5455e3dbb1f5c3245ddaadc53048c7beaeb46af75aebacfe62")
    let groupsBytes = ArrayList<UInt8>()
    for (g in groups) { for (b in ksU16Bytes(g)) { groupsBytes.add(b) } }
    let ksEntries = ArrayList<ArrayList<UInt8>>()
    for ((g, k) in kses) {
        let e = ArrayList<UInt8>()
        for (b in ksU16Bytes(g)) { e.add(b) }
        for (b in ksU16Bytes(UInt16(k.size))) { e.add(b) }
        for (b in k) { e.add(b) }
        ksEntries.add(e)
    }
    let parts = ArrayList<ArrayList<UInt8>>()
    parts.add(ksExt(0x002b, [0x02u8, 0x03u8, 0x04u8]))                       // sv=[TLS1.3]
    parts.add(ksExt(0x000a, ksConcat(ksU16Bytes(UInt16(groupsBytes.size)), groupsBytes.toArray())))
    parts.add(ksExt(0x0033, ksConcat(ksU16Bytes(UInt16(ksJoin(ksEntries).size)), ksJoin(ksEntries))))
    parts.add(ksExt(0x000d, [0x00u8, 0x04u8, 0x04u8, 0x01u8, 0x08u8, 0x04u8])) // sigalgs
    let exts = ksJoin(parts)
    let body = ArrayList<UInt8>()
    body.add(0x03u8); body.add(0x03u8)                                          // legacy_version 0303
    let rnd = ksHexToBytes("000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f")
    for (b in rnd) { body.add(b) }
    body.add(0x20u8)                                                            // sid_len 32
    for (b in sid) { body.add(b) }
    for (b in ksU16Bytes(0x0002)) { body.add(b) }                               // cipher list len 2
    body.add(0x13u8); body.add(0x01u8)                                          // TLS_AES_128_GCM_SHA256
    body.add(0x01u8); body.add(0x00u8)                                          // compression
    for (b in ksU16Bytes(UInt16(exts.size))) { body.add(b) }
    for (b in exts) { body.add(b) }
    let hs = ArrayList<UInt8>()
    hs.add(0x01u8)                                                              // ClientHello
    hs.add(0x00u8); hs.add(UInt8(body.size >> 8)); hs.add(UInt8(body.size & 0xFF))
    for (b in body) { hs.add(b) }
    let rec = ArrayList<UInt8>()
    rec.add(0x16u8); rec.add(0x03u8); rec.add(0x01u8)
    rec.add(UInt8(hs.size >> 8)); rec.add(UInt8(hs.size & 0xFF))
    for (b in hs) { rec.add(b) }
    return rec.toArray()
}

// response classification: ALERT <desc> / SH (ServerHello or HRR) / FIN / SILENT / RST
func ksReadResp(sock: TcpSocket, timeoutMs: Int64): String {
    sock.readTimeout = Duration.millisecond * Int64(timeoutMs)
    let buf = Array<UInt8>(16384, repeat: 0)
    var got = 0
    try {
        while (got < 5) {
            let n = sock.read(buf[got..])
            if (n <= 0) { return "FIN" }
            got += Int(n)
        }
        let rlen = (Int64(buf[3]) << 8) + Int64(buf[4])
        while (got < 5 + rlen) {
            let n = sock.read(buf[got..])
            if (n <= 0) { break }
            got += Int(n)
        }
        if (buf[0] == 21 && got >= 7) { return "ALERT ${buf[6]}" }
        if (buf[0] == 22) { return "SH" }
        return "TYPE${buf[0]}"
    } catch (e: Exception) {
        return "SILENT"
    }
}

func ksStartServer(): (Server, Int64) {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(ksPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(ksPem("end_rsa_private_key.pem")))
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
    s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return (s, Int64(s.port))
}

@Test
class HuntTlsKeyShare {
    // GREEN guard: baseline valid share negotiates
    @TestCase
    func baselineValidShareNegotiates(): Unit {
        let (server, port) = ksStartServer()
        sleep(Duration.millisecond * 100)
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        let xk = ksHexToBytes("db08bfc01b03fc5455e3dbb1f5c3245ddaadc53048c7beaeb46af75aebacfe62")
        let ch = ksBuildCh([0x001d], ksMakeKses([(0x001d, xk)]))
        sock.write(ch)
        let resp = ksReadResp(sock, 6000)
        sock.close()
        server.close()
        println("[ks] baseline response=${resp}")
        @Expect(resp == "SH", true)
    }

    // RED (issue 66): unsupported-group key_share entries must be ignored; the valid
    // x25519 share must be used → ServerHello. Currently: ALERT illegal_parameter.
    @TestCase
    func keyshareUnknownEntriesIgnored(): Unit {
        let (server, port) = ksStartServer()
        sleep(Duration.millisecond * 100)
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        let xk = ksHexToBytes("db08bfc01b03fc5455e3dbb1f5c3245ddaadc53048c7beaeb46af75aebacfe62")
        let ch = ksBuildCh([0x001d], ksMakeKses([
            (0x001d, xk),
            (0x11ec, Array<UInt8>(1152, repeat: 0x11u8)),
            (0x0100, Array<UInt8>(256, repeat: 0x05u8)),
        ]))
        sock.write(ch)
        let resp = ksReadResp(sock, 6000)
        sock.close()
        server.close()
        println("[ks] unknown-entries response=${resp}")
        @Expect(resp == "SH", true)   // 实测 ALERT 47（illegal_parameter）— issue 66
    }

    // RED (issue 66): only-unknown-group share → MUST HRR (x25519 in supported_groups),
    // not abort. Currently: ALERT illegal_parameter.
    @TestCase
    func keyshareOnlyUnknownGroupHrr(): Unit {
        let (server, port) = ksStartServer()
        sleep(Duration.millisecond * 100)
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        let xk = ksHexToBytes("db08bfc01b03fc5455e3dbb1f5c3245ddaadc53048c7beaeb46af75aebacfe62")
        let ch = ksBuildCh([0x001d], ksMakeKses([(0x0999, xk)]))
        sock.write(ch)
        let resp = ksReadResp(sock, 6000)
        sock.close()
        server.close()
        println("[ks] only-unknown response=${resp}")
        @Expect(resp == "SH", true)   // 实测 ALERT 47 — 应 HRR（SH/HRR 形态均为 SH 记录类型）
    }
}
