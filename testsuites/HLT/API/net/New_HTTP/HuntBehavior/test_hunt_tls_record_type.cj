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

// issue 65: TLS record layer must respond with unexpected_message alert + close on
// invalid record content types (RFC 8446 §B.1/§5.2). Currently a record with unknown
// content type (0x99) gets NO response and NO FIN — connection stays open (silent hang).
//   RED pin: invalidRecordTypeAlerts — expects an alert response; currently SILENT.
//   GREEN guard: appDataFirstAlerts — 0x17 app-data as first record DOES get
//                unexpected_message (documents correct path, anti-over-fix).

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

func rtPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func rtEchoServer(): (Server, Int64) {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(rtPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(rtPem("end_rsa_private_key.pem")))
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
    s.distributor.register("/", { ctx => ctx.responseBuilder.body("ok") })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return (s, Int64(s.port))
}

// returns description of first response bytes within timeoutMs
// "SILENT" = no data AND no FIN (connection left open) — the issue-65 signature
// "ALERT <desc>" = fatal alert record received
// "FIN" = closed without data
func rtReadResp(sock: TcpSocket, timeoutMs: Int64): String {
    sock.readTimeout = Duration.millisecond * Int64(timeoutMs)
    let buf = Array<UInt8>(4096, repeat: 0)
    try {
        let n = sock.read(buf)
        if (n <= 0) { return "FIN" }
        if (buf[0] == 21 && n >= 7) {
            return "ALERT ${buf[6]}"
        }
        return "TYPE${buf[0]} ${n}B"
    } catch (e: Exception) {
        return "SILENT"
    }
}

@Test
class HuntTlsRecordType {
    // RED (issue 65): record content-type 0x99 (11 bytes, pre-handshake) must produce
    // an unexpected_message alert + close. Currently: SILENT, connection stays open.
    @TestCase
    func invalidRecordTypeAlerts(): Unit {
        let (server, port) = rtEchoServer()
        sleep(Duration.millisecond * 100)
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        sock.write([0x99u8, 0x03u8, 0x01u8, 0x00u8, 0x04u8, 0x64u8, 0x65u8, 0x61u8, 0x64u8])
        let resp = rtReadResp(sock, 6000)
        sock.close()
        server.close()
        println("[rt] invalid-type response=${resp}")
        @Expect(resp.startsWith("ALERT"), true)   // 实测 SILENT — 静默挂死（issue 65）
    }

    // GREEN guard (issue 65): app-data record as FIRST record correctly gets
    // unexpected_message — documents the correct path so a fix cannot regress it.
    @TestCase
    func appDataFirstAlertsUnexpectedMessage(): Unit {
        let (server, port) = rtEchoServer()
        sleep(Duration.millisecond * 100)
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        sock.write([0x17u8, 0x03u8, 0x03u8, 0x00u8, 0x04u8, 0x64u8, 0x65u8, 0x61u8, 0x64u8])
        let resp = rtReadResp(sock, 6000)
        sock.close()
        server.close()
        println("[rt] appdata-first response=${resp}")
        @Expect(resp == "ALERT 10", true)   // unexpected_message + FIN（当前已正确）
    }

    // GREEN guard (b57 S5): ClientHello with lying extensions-total-length field (0xFFFF)
    // → illegal_parameter alert + close. Currently correct; protects the path when
    // issue 65's silent paths get fixed.
    @TestCase
    func clientHelloLyingExtLenAlerts(): Unit {
        let (server, port) = rtEchoServer()
        sleep(Duration.millisecond * 100)
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        let b = ArrayList<UInt8>()
        b.add(0x03u8); b.add(0x03u8)                       // legacy_version
        for (_ in 0..32) { b.add(0x11u8) }                 // random
        b.add(0x00u8)                                      // sid_len 0
        b.add(0x00u8); b.add(0x02u8); b.add(0x13u8); b.add(0x01u8)  // ciphers [1301]
        b.add(0x01u8); b.add(0x00u8)                       // compression
        b.add(0xFFu8); b.add(0xFFu8)                       // lying ext total length
        b.add(0x00u8); b.add(0x0au8); b.add(0x00u8); b.add(0x02u8)  // ext 000a (partial)
        b.add(0x00u8); b.add(0x1du8)
        let hs = ArrayList<UInt8>()
        hs.add(0x01u8)
        hs.add(0x00u8); hs.add(UInt8(b.size >> 8)); hs.add(UInt8(b.size & 0xFF))
        for (x in b) { hs.add(x) }
        let rec = ArrayList<UInt8>()
        rec.add(0x16u8); rec.add(0x03u8); rec.add(0x01u8)
        rec.add(UInt8(hs.size >> 8)); rec.add(UInt8(hs.size & 0xFF))
        for (x in hs) { rec.add(x) }
        sock.write(rec.toArray())
        let resp = rtReadResp(sock, 6000)
        sock.close()
        server.close()
        println("[rt] lying-extlen response=${resp}")
        @Expect(resp.startsWith("ALERT"), true)   // 当前 illegal_parameter(50) + FIN ✓
    }

    // GREEN guard (b57 S8): handshake record with garbage/zero-length body
    // → illegal_parameter alert + close.
    @TestCase
    func garbageHandshakeBodyAlerts(): Unit {
        let (server, port) = rtEchoServer()
        sleep(Duration.millisecond * 100)
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        sock.write([0x16u8, 0x03u8, 0x03u8, 0x00u8, 0x08u8, 0x01u8, 0x00u8, 0x00u8, 0x00u8,
                    0x03u8, 0x03u8, 0xdeu8, 0xadu8])
        let resp = rtReadResp(sock, 6000)
        sock.close()
        server.close()
        println("[rt] garbage-hs response=${resp}")
        @Expect(resp.startsWith("ALERT"), true)   // 当前 illegal_parameter(50) + FIN ✓
    }

    // GREEN guard (T2 tlsfuzzer record-layer-limits): record declaring length above
    // 2^14+256 → record_overflow (22) alert + close. Sends the FULL oversized record.
    @TestCase
    func oversizedRecordRecordOverflow(): Unit {
        let (server, port) = rtEchoServer()
        sleep(Duration.millisecond * 100)
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        let total = 20480                       // > 16640 (2^14 + 256)
        let rec = Array<UInt8>(total, repeat: 0x41u8)
        rec[0] = 0x16u8; rec[1] = 0x03u8; rec[2] = 0x03u8
        rec[3] = UInt8((total - 5) >> 8); rec[4] = UInt8((total - 5) & 0xFF)
        sock.write(rec)
        let resp = rtReadResp(sock, 6000)
        sock.close()
        server.close()
        println("[rt] oversized response=${resp}")
        @Expect(resp.startsWith("ALERT"), true)   // 当前 record_overflow(22) + FIN ✓
    }
}
