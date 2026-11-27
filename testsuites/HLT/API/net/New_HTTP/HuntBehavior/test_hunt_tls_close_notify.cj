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

// issue 35: stdx TLS server closes sessions without close_notify (RFC 8446 §6.1 MUST).
// Detection: raw-TCP middleman between stdx TLS client and stdx TLS server counts TLS
// record types per direction (0x15=alert). Server closing after "Connection: close"
// response MUST emit an alert record (close_notify) before FIN.
//   clientAlerts: diagnostic only (stdx client close semantics unknown)
//   serverAlerts: RED pin — currently 0, must be >= 1

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

func cnPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func cnEchoServer(): (Server, Int64) {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(cnPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(cnPem("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["http/1.1"]
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg).build()
    s.distributor.register("/", { ctx => ctx.responseBuilder.header("Connection", "close").body("ok") })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return (s, Int64(s.port))
}

// parse complete TLS records from the accumulator, forward to dst, count alerts
func cnDrainRecords(buf: ArrayList<UInt8>, dst: TcpSocket, alertCounter: AtomicInt64): Unit {
    while (true) {
        if (buf.size < 5) { return }
        let rtype = buf[0]
        let rlen = (Int64(buf[3]) << 8) + Int64(buf[4])
        if (buf.size < 5 + rlen) { return }
        if (rtype == 0x15) { alertCounter.fetchAdd(1) }
        let recLen = 5 + rlen
        let rec = Array<UInt8>(recLen, repeat: 0)
        for (i in 0..recLen) { rec[i] = buf[i] }
        dst.write(rec)
        buf.remove(0..recLen)
    }
}

func cnAppend(buf: ArrayList<UInt8>, data: Array<UInt8>): Unit {
    for (b in data) { buf.add(b) }
}

@Test
class TlsCloseNotify {
    // RED (issue 35): server MUST send close_notify (alert record 0x15) before closing
    @TestCase
    func serverSendsCloseNotifyOnClose(): Unit {
        let (server, upstreamPort) = cnEchoServer()
        let clientAlerts = AtomicInt64(0)
        let serverAlerts = AtomicInt64(0)
        let serverEof = AtomicBool(false)
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
                    let clientSock = listener.accept()
                    let upstream = TcpSocket("127.0.0.1", UInt16(upstreamPort))
                    upstream.connect()
                    // server→client direction: parse + count + forward
                    spawn {
                        let buf = ArrayList<UInt8>()
                        let tmp = Array<UInt8>(16384, repeat: 0)
                        while (true) {
                            var n = 0
                            var err = false
                            try { n = upstream.read(tmp) } catch (e: Exception) { err = true }
                            if (err || n <= 0) { serverEof.store(true); break }
                            cnAppend(buf, tmp[0..n])
                            cnDrainRecords(buf, clientSock, serverAlerts)
                        }
                        serverEof.store(true)
                    }
                    // client→server direction
                    spawn {
                        let buf = ArrayList<UInt8>()
                        let tmp = Array<UInt8>(16384, repeat: 0)
                        while (true) {
                            var n = 0
                            var err = false
                            try { n = clientSock.read(tmp) } catch (e: Exception) { err = true }
                            if (err || n <= 0) { break }
                            cnAppend(buf, tmp[0..n])
                            cnDrainRecords(buf, upstream, clientAlerts)
                        }
                    }
                } catch (e: Exception) { return }
            }
        }
        sleep(Duration.millisecond * 150)
        var ccfg = TlsClientConfig()
        ccfg.verifyMode = TrustAll
        let c = ClientBuilder().tlsConfig(ccfg).readTimeout(5 * Duration.second).build()
        var out = ""
        try {
            let resp = c.send(HttpRequestBuilder().url("https://127.0.0.1:${port}/")
                .header("Connection", "close").build())
            let buffer = ArrayList<UInt8>()
            let chunk = Array<UInt8>(4096, repeat: 0)
            while (true) {
                let n = resp.body.read(chunk)
                if (n <= 0) { break }
                for (i in 0..n) { buffer.add(chunk[i]) }
            }
            out = "status=${resp.status} body=[${String.fromUtf8(buffer.toArray())}]"
        } catch (e: Exception) { out = "EXC: ${e.message}" }
        c.close()
        // wait for the server side to close and flush trailing records
        var w = 0
        while (!serverEof.load() && w < 5000) {
            sleep(Duration.millisecond * 100)
            w += 100
        }
        sleep(Duration.millisecond * 300)
        listener.close()
        server.close()
        println("[cn35] request=${out} clientAlerts=${clientAlerts.load()} serverAlerts=${serverAlerts.load()} serverEof=${serverEof.load()}")
        @Expect(serverAlerts.load() >= 1, true)
    }
}
