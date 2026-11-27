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

func hp8(v: Int64): UInt8 { return UInt8(v & 0xFF) }

func hpFrame(ftype: UInt8, flags: UInt8, sid: Int64, payload: Array<UInt8>): Array<UInt8> {
    let out = Array<UInt8>(9 + payload.size, repeat: 0)
    let l = payload.size
    out[0] = hp8(l >> 16); out[1] = hp8(l >> 8); out[2] = hp8(l)
    out[3] = ftype; out[4] = flags
    let id = sid & 0x7FFFFFFF
    out[5] = hp8(id >> 24); out[6] = hp8(id >> 16); out[7] = hp8(id >> 8); out[8] = hp8(id)
    for (i in 0..payload.size) { out[9 + i] = payload[i] }
    return out
}

func hpReadExact(sock: TlsSocket, buf: Array<UInt8>): Bool {
    var got = 0
    while (got < buf.size) {
        let n = sock.read(buf[got..])
        if (n <= 0) { return false }
        got += n
    }
    return true
}

func hpReadFrame(sock: TlsSocket): (Bool, UInt8, UInt8, Int64, Array<UInt8>) {
    let h = Array<UInt8>(9, repeat: 0)
    if (!hpReadExact(sock, h)) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    let len = (Int64(h[0]) << 16) + (Int64(h[1]) << 8) + Int64(h[2])
    let ftype = h[3]
    let flags = h[4]
    var sid = (Int64(h[5]) << 24) + (Int64(h[6]) << 16) + (Int64(h[7]) << 8) + Int64(h[8])
    sid = sid & 0x7FFFFFFF
    let payload = Array<UInt8>(len, repeat: 0)
    if (len > 0) {
        if (!hpReadExact(sock, payload)) { return (false, 0, 0, 0, Array<UInt8>(0, repeat: 0)) }
    }
    return (true, ftype, flags, sid, payload)
}

func hpPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func hpStartServer(): (Server, Int64) {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(hpPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(hpPem("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["h2"]
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
    s.distributor.register("/", { ctx =>
        let path = ctx.request.url.path
        ctx.responseBuilder.body("p=${path}")
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return (s, Int64(s.port))
}

func hpConnect(port: Int64): TlsSocket {
    let tcp = TcpSocket("127.0.0.1", UInt16(port))
    tcp.connect()
    var ccfg = TlsClientConfig()
    ccfg.verifyMode = TrustAll
    ccfg.supportedAlpnProtocols = ["h2"]
    let ts = TlsSocket.client(tcp, clientConfig: ccfg)
    let hr = ts.handshake()
    ts.write("PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n".toArray())
    ts.write(hpFrame(0x4, 0, 0, Array<UInt8>(0, repeat: 0)))
    let (ok, t, _, _, _) = hpReadFrame(ts)
    if (ok && t == 0x4) {
        ts.write(hpFrame(0x4, 0x1, 0, Array<UInt8>(0, repeat: 0)))
    }
    return ts
}

func hpSendHdrs(sock: TlsSocket, sid: Int64, wire: Array<UInt8>): String {
    sock.write(hpFrame(0x1, 0x5, sid, wire))
    var guardI = 0
    while (guardI < 30) {
        guardI += 1
        let (ok, ft, fl, rsid, pl) = hpReadFrame(sock)
        if (!ok) { return "EOF" }
        if (ft == 0x4 && (fl & 0x1) == 0) {
            sock.write(hpFrame(0x4, 0x1, 0, Array<UInt8>(0, repeat: 0)))
            continue
        }
        if (ft == 0x6 && (fl & 0x1) == 0) {
            sock.write(hpFrame(0x6, 0x1, 0, pl))
            continue
        }
        if (ft == 0x1 && rsid == sid) { return "OK" }
        if (ft == 0x0 && rsid == sid && (fl & 0x1) != 0) { return "OK" }
        if (ft == 0x7) { return "GOAWAY" }
        if (ft == 0x3) { return "RST" }
    }
    return "TIMEOUT"
}

func hpLitNoIndex(name: String, value: String): Array<UInt8> {
    let out = ArrayList<UInt8>()
    out.add(0x00)
    let n = name.toArray(); let v = value.toArray()
    if (n.size < 127) { out.add(hp8(n.size)) } else { out.add(0x7F); out.add(hp8(n.size - 127)) }
    for (b in n) { out.add(b) }
    if (v.size < 127) { out.add(hp8(v.size)) } else { out.add(0x7F); out.add(hp8(v.size - 127)) }
    for (b in v) { out.add(b) }
    return out.toArray()
}

@Test
class HuntHpackDecoder {
    @TestCase
    func staticTableAndLiteralNoIndexing(): Unit {
        let (server, port) = hpStartServer()
        let ts = hpConnect(port)
        let wire = ArrayList<UInt8>()
        wire.add(0x82); wire.add(0x87); wire.add(0x84)
        for (b in hpLitNoIndex(":authority", "127.0.0.1:${port}")) { wire.add(b) }
        let result = hpSendHdrs(ts, 1, wire.toArray())
        println("[HPACK-static] result=${result}")
        @Expect(result, "OK")
        try { ts.close() } catch (e: Exception) { () }
        server.close()
    }

    @TestCase
    func literalIncrementalIndexingAccepted(): Unit {
        let (server, port) = hpStartServer()
        let ts = hpConnect(port)
        let wire = ArrayList<UInt8>()
        wire.add(0x82); wire.add(0x87); wire.add(0x84)
        wire.add(0x40)
        wire.add(0x05); for (b in "x-foo".toArray()) { wire.add(b) }
        wire.add(0x05); for (b in "hello".toArray()) { wire.add(b) }
        for (b in hpLitNoIndex(":authority", "127.0.0.1:${port}")) { wire.add(b) }
        let result = hpSendHdrs(ts, 3, wire.toArray())
        println("[HPACK-incr] result=${result}")
        @Expect(result, "OK")
        try { ts.close() } catch (e: Exception) { () }
        server.close()
    }
}
