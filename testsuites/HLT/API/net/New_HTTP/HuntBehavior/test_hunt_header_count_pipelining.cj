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
import stdx.encoding.url.*
import std.net.*
import std.io.*
import std.convert.*
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func hhReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(65536, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func hhBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(hhReadAll(resp.body))
}

func hhPem(name: String): String {
    return String.fromUtf8(readToEnd(File("data/${name}", Read)))
}

func hhH2SrvCfg(): TlsServerConfig {
    var cfg = TlsServerConfig(X509Certificate.decodeFromPem(hhPem("end_rsa.cer")),
        GeneralPrivateKey.decodeFromPem(hhPem("end_rsa_private_key.pem")))
    cfg.supportedAlpnProtocols = ["h2"]
    return cfg
}

func hhH2CliCfg(): TlsClientConfig {
    var cfg = TlsClientConfig()
    cfg.verifyMode = CustomCA(X509Certificate.decodeFromPem(hhPem("root_rsa.cer")).map({c => c}))
    cfg.supportedAlpnProtocols = ["h2"]
    return cfg
}

func hhH2Client(limit: UInt32): Client {
    return ClientBuilder().tlsConfig(hhH2CliCfg()).maxHeaderListSize(limit)
        .readTimeout(10 * Duration.second).build()
}

func hhStartH2Srv(): Server {
    var cfg = hhH2SrvCfg()
    let s = ServerBuilder().addr("127.0.0.1").port(0).tlsConfig(cfg)
        .maxRequestHeaderSize(1048576).build()
    s.distributor.register("/hdrs", { ctx =>
        let n = ctx.request.headers.get("x-big").size
        ctx.responseBuilder.body("received-${n}")
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func hhFindDoubleCRLF(data: Array<UInt8>): Int64 {
    for (i in 0..(data.size - 3)) {
        if (data[i] == 0x0d && data[i+1] == 0x0a && data[i+2] == 0x0d && data[i+3] == 0x0a) { return i }
    }
    return -1
}

func hhParseCL(headStr: String): Int64 {
    for (line in headStr.split("\r\n")) {
        if (line.startsWith("Content-Length:") || line.startsWith("content-length:")) {
            let val = line[15..line.size]
            var v = val
            while (v.size > 0 && (v[0] == 32 || v[0] == 9)) { v = v[1..v.size] }
            return Int64.parse(v)
        }
    }
    return 0
}

func hhPortOf(listener: TcpServerSocket): Int64 {
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

func hhCountResponses(reply: String): Int64 {
    var count: Int64 = 0
    var idx: Int64 = 0
    while (idx < reply.size) {
        let sub = reply[idx..reply.size]
        match (sub.indexOf("HTTP/1.1 200")) {
            case Some(p) =>
                count += 1
                idx += p + 12
            case None => break
        }
    }
    return count
}

@Test
class HeaderCountLimitHunt {
    var server: Server
    var client: Client

    init() {
        server = ServerBuilder().addr("127.0.0.1").port(0).build()
        client = ClientBuilder().readTimeout(10 * Duration.second).build()
        spawn { server.serve() }
        while (server.port == 0) { sleep(Duration.millisecond) }
    }

    ~init() {
        client.close()
        server.close()
    }

    @TestCase
    func request200Headers(): Unit {
        var b = HttpRequestBuilder().url("http://127.0.0.1:${Int64(server.port)}/echo")
        for (i in 0..200) { b.header("x-hdr-${i}", "val${i}") }
        let r = client.send(b.post().build())
        println("[hc] 200 headers: status=${r.status} resp=[${hhBodyOf(r)}]")
        @Expect(r.status == 413 || r.status == 431, true)
    }

    @TestCase
    func request500Headers(): Unit {
        var b = HttpRequestBuilder().url("http://127.0.0.1:${Int64(server.port)}/echo")
        for (i in 0..500) { b.header("x-hdr-${i}", "val${i}") }
        let r = client.send(b.post().build())
        println("[hc] 500 headers: status=${r.status} resp=[${hhBodyOf(r)}]")
        @Expect(r.status == 413 || r.status == 431, true)
    }

    @TestCase
    func response50Headers(): Unit {
        let s2 = ServerBuilder().addr("127.0.0.1").port(0).build()
        s2.distributor.register("/many", { ctx =>
            for (i in 0..50) { ctx.responseBuilder.header("x-resp-${i}", "val${i}") }
            ctx.responseBuilder.body("50-headers")
        })
        spawn { s2.serve() }
        while (s2.port == 0) { sleep(Duration.millisecond) }
        let r = client.get("http://127.0.0.1:${Int64(s2.port)}/many")
        var count: Int64 = 0
        for ((name, _) in r.headers) {
            if (name.startsWith("x-resp-")) { count += 1 }
        }
        println("[hc] 50 headers resp: x-resp-count=${count}")
        @Expect(r.status, 200)
        @Expect(count, 50)
        s2.close()
    }
}

@Test
class PipeliningStressHunt {
    var server: Server
    var client: Client

    init() {
        server = ServerBuilder().addr("127.0.0.1").port(0).build()
        client = ClientBuilder().readTimeout(10 * Duration.second).build()
    }

    ~init() {
        client.close()
        server.close()
    }

    @TestCase
    func pipelining100CL(): Unit {
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        spawn {
            while (true) {
                try {
                    let sock = listener.accept()
                    spawn {
                        try {
                            let pending = ArrayList<UInt8>()
                            let buf = Array<UInt8>(65536, repeat: 0)
                            while (true) {
                                let n = sock.read(buf)
                                if (n <= 0) { break }
                                for (i in 0..n) { pending.add(buf[i]) }
                                while (true) {
                                    let data = pending.toArray()
                                    let headEnd = hhFindDoubleCRLF(data)
                                    if (headEnd < 0) { break }
                                    let headStr = String.fromUtf8(data[0..headEnd])
                                    let cl = hhParseCL(headStr)
                                    let bodyStart = headEnd + 4
                                    let bodyEnd = bodyStart + cl
                                    if (Int64(data.size) < bodyEnd) { break }
                                    let bodyStr = String.fromUtf8(data[bodyStart..bodyEnd])
                                    let resp = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: ${bodyStr.size}\r\n\r\n${bodyStr}"
                                    sock.write(resp.toArray().map({ b => UInt8(b) }))
                                    var newPending = ArrayList<UInt8>()
                                    for (j in bodyEnd..data.size) { newPending.add(data[j]) }
                                    pending.clear()
                                    for (b in newPending) { pending.add(b) }
                                }
                            }
                            sock.close()
                        } catch (e: Exception) { () }
                    }
                } catch (e: Exception) { return }
            }
        }
        let port = hhPortOf(listener)
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        let sb = StringBuilder()
        for (i in 0..100) { sb.append("GET /req-${i} HTTP/1.1\r\nHost: a\r\n\r\n") }
        sock.write(sb.toString().toArray().map({ b => UInt8(b) }))
        var reply = ""
        let buf = Array<UInt8>(65536, repeat: 0)
        spawn { sleep(Duration.second * 10); try { sock.close() } catch (e: Exception) { () } }
        while (true) {
            var n = 0
            var err = false
            try { n = sock.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            reply += String.fromUtf8(buf[0..n])
        }
        sock.close()
        let count = hhCountResponses(reply)
        println("[pp] pipelined 100 CL: responses=${count}")
        @Expect(count, 100)
        listener.close()
    }

    @TestCase
    func pipelining100Mixed(): Unit {
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        spawn {
            while (true) {
                try {
                    let sock = listener.accept()
                    spawn {
                        try {
                            let pending = ArrayList<UInt8>()
                            let buf = Array<UInt8>(65536, repeat: 0)
                            while (true) {
                                let n = sock.read(buf)
                                if (n <= 0) { break }
                                for (i in 0..n) { pending.add(buf[i]) }
                                while (true) {
                                    let data = pending.toArray()
                                    let headEnd = hhFindDoubleCRLF(data)
                                    if (headEnd < 0) { break }
                                    let headStr = String.fromUtf8(data[0..headEnd])
                                    let cl = hhParseCL(headStr)
                                    let bodyStart = headEnd + 4
                                    let bodyEnd = bodyStart + cl
                                    if (Int64(data.size) < bodyEnd) { break }
                                    let bodyStr = String.fromUtf8(data[bodyStart..bodyEnd])
                                    let resp = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: ${bodyStr.size}\r\n\r\n${bodyStr}"
                                    sock.write(resp.toArray().map({ b => UInt8(b) }))
                                    var newPending = ArrayList<UInt8>()
                                    for (j in bodyEnd..data.size) { newPending.add(data[j]) }
                                    pending.clear()
                                    for (b in newPending) { pending.add(b) }
                                }
                            }
                            sock.close()
                        } catch (e: Exception) { () }
                    }
                } catch (e: Exception) { return }
            }
        }
        let port = hhPortOf(listener)
        let sock = TcpSocket("127.0.0.1", UInt16(port))
        sock.connect()
        let sb = StringBuilder()
        for (i in 0..100) {
            if (i % 2 == 0) {
                sb.append("GET /req-${i} HTTP/1.1\r\nHost: a\r\n\r\n")
            } else {
                sb.append("POST /req-${i} HTTP/1.1\r\nHost: a\r\nContent-Length: 4\r\n\r\nABCD")
            }
        }
        sock.write(sb.toString().toArray().map({ b => UInt8(b) }))
        var reply = ""
        let buf = Array<UInt8>(65536, repeat: 0)
        spawn { sleep(Duration.second * 10); try { sock.close() } catch (e: Exception) { () } }
        while (true) {
            var n = 0
            var err = false
            try { n = sock.read(buf) } catch (e: Exception) { err = true }
            if (err || n <= 0) { break }
            reply += String.fromUtf8(buf[0..n])
        }
        sock.close()
        let count = hhCountResponses(reply)
        println("[pp] pipelined 100 mixed: responses=${count}")
        @Expect(count, 100)
        listener.close()
    }

    @TestCase
    func response50Headers(): Unit {
        let s2 = ServerBuilder().addr("127.0.0.1").port(0).build()
        s2.distributor.register("/many", { ctx =>
            for (i in 0..50) { ctx.responseBuilder.header("x-resp-${i}", "val${i}") }
            ctx.responseBuilder.body("50-headers")
        })
        spawn { s2.serve() }
        while (s2.port == 0) { sleep(Duration.millisecond) }
        let r = client.get("http://127.0.0.1:${Int64(s2.port)}/many")
        var count: Int64 = 0
        for ((name, _) in r.headers) {
            if (name.startsWith("x-resp-")) { count += 1 }
        }
        println("[pp] 50 headers resp: x-resp-count=${count}")
        @Expect(r.status, 200)
        @Expect(count, 50)
        s2.close()
    }
}
