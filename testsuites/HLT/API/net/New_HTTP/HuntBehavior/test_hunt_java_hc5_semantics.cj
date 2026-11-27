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
import std.net.*
import std.io.*
import std.convert.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

let jServerBytes = AtomicInt64(0)
let jBodyAfter401 = AtomicBool(false)

func jTrim(s: String): String {
    return s.trimStart({ x: Rune => x == r' ' }).trimEnd({ x: Rune => x == r' ' })
}

func jBodyOf(r: HttpResponse): String {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = r.body.read(chunk)
        if (n <= 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return String.fromUtf8(buffer.toArray())
}

class AbortStream <: InputStream {
    let sent = AtomicBool(false)
    public func read(buf: Array<UInt8>): Int64 {
        if (!sent.load()) {
            sent.store(true)
            for (i in 0..512) { buf[i] = UInt8(i & 0xFF) }
            return 512
        }
        throw IOException("stream aborted mid-body")
    }
}

class CleanStream <: InputStream {
    let n = AtomicInt64(0)
    public func read(buf: Array<UInt8>): Int64 {
        let c = n.fetchAdd(1)
        if (c >= 8) { return 0 }
        for (i in 0..64) { buf[i] = UInt8((c * 64 + i) & 0xFF) }
        return 64
    }
}

func jStartRawServer(): (TcpServerSocket, Int64) {
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
                let sock = listener.accept()
                spawn {
                    sock.readTimeout = Duration.second * 12
                    try {
                        while (true) {
                            let acc = ArrayList<UInt8>()
                            let tmp = Array<UInt8>(8192, repeat: 0)
                            var headerDone = false
                            var closed = false
                            while (!headerDone) {
                                var n = 0
                                var err = false
                                try { n = sock.read(tmp) } catch (e: Exception) { err = true }
                                if (err || n <= 0) { closed = true; break }
                                for (i in 0..n) { acc.add(tmp[i]) }
                                if (String.fromUtf8(acc.toArray()).contains("\r\n\r\n")) { headerDone = true }
                            }
                            if (closed) { break }
                            let req = String.fromUtf8(acc.toArray())
                            let path = jTrim(req.split(" ")[1])
                            if (path.startsWith("/echo")) {
                                let segs = req.split("content-length:")
                                var cl: Int64 = 0
                                if (segs.size > 1) {
                                    var v = ""
                                    let bts = segs[1].toArray()
                                    var k = 0
                                    while (k < bts.size && bts[k] >= 48u8 && bts[k] <= 57u8) { v += String.fromUtf8([bts[k]]); k += 1 }
                                    if (v != "") { cl = Int64.parse(v) }
                                }
                                if (cl > 0) {
                                    let headEnd = req.indexOf("\r\n\r\n")
                                    var consumed: Int64 = 0
                                    match (headEnd) {
                                        case Some(hi) => consumed = acc.size - hi - 4
                                        case None => ()
                                    }
                                    var need = cl - consumed
                                    while (need > 0) {
                                        var n = 0
                                        var err = false
                                        try { n = sock.read(tmp) } catch (e: Exception) { err = true }
                                        if (err || n <= 0) { break }
                                        need -= n
                                        jServerBytes.fetchAdd(n)
                                    }
                                }
                                sock.write("HTTP/1.1 200 OK\r\nContent-Length: 4\r\n\r\njok1".toArray())
                            } else if (path.startsWith("/expect401")) {
                                sock.write("HTTP/1.1 401 Unauthorized\r\nContent-Length: 0\r\n\r\n".toArray())
                                let obs = Array<UInt8>(8192, repeat: 0)
                                try {
                                    let n = sock.read(obs)
                                    if (n > 0) { jBodyAfter401.store(true) }
                                } catch (e: Exception) { () }
                            } else if (path.startsWith("/halfbody")) {
                                sock.write("HTTP/1.1 200 OK\r\nContent-Length: 100\r\n\r\n".toArray())
                                sock.write(Array<UInt8>(10, repeat: 0x41).toArray())
                                sleep(Duration.second * 30)
                            }
                        }
                    } catch (e: Exception) { () }
                    sock.close()
                }
            } catch (e: Exception) { return }
        }
    }
    return (listener, port)
}

func jStartChunkedServer(): (Server, Int64) {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/chunked", { ctx =>
        let buffer = ArrayList<UInt8>()
        let chunk = Array<UInt8>(4096, repeat: 0)
        while (true) {
            let n = ctx.request.body.read(chunk)
            if (n <= 0) { break }
            for (i in 0..n) { buffer.add(chunk[i]) }
        }
        ctx.responseBuilder.body("len=${buffer.size}")
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return (s, Int64(s.port))
}

@Test
class JavaHc5Semantics {
    // GREEN: aborting InputStream propagates immediately, server receives 0 bytes
    @TestCase
    func streamAbortPropagatesImmediately(): Unit {
        jServerBytes.store(0)
        let (listener, port) = jStartRawServer()
        sleep(Duration.millisecond * 200)
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        var out = ""
        try {
            let resp = c.send(HttpRequestBuilder().url("http://127.0.0.1:${port}/echo")
                .body(AbortStream()).header("Content-Length", "1024").build())
            out = "status=${resp.status}"
        } catch (e: Exception) { out = "EXC: ${e.message}" }
        c.close()
        listener.close()
        println("[jhc-J1] abort-stream => ${out} serverGot=${jServerBytes.load()}/1024")
        @Expect(out.startsWith("EXC"), true)
        @Expect(jServerBytes.load(), 0)
    }

    // GREEN (issue 12 fix): TE:chunked + InputStream streams end-to-end via stdx server decode
    @TestCase
    func teChunkedStreamingWorks(): Unit {
        let (s, port) = jStartChunkedServer()
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        var out = ""
        try {
            let resp = c.send(HttpRequestBuilder().url("http://127.0.0.1:${port}/chunked")
                .header("Transfer-Encoding", "chunked")
                .body(CleanStream()).build())
            out = "status=${resp.status} resp=[${jBodyOf(resp)}]"
        } catch (e: Exception) { out = "EXC: ${e.message}" }
        c.close()
        s.close()
        println("[jhc-J2] te-chunked => ${out}")
        @Expect(out, "status=200 resp=[len=512]")
    }

    // GREEN: Expect:100-continue + immediate 401 — body must not leak after the 401
    @TestCase
    func expect401NoBodyLeak(): Unit {
        jBodyAfter401.store(false)
        let (listener, port) = jStartRawServer()
        sleep(Duration.millisecond * 200)
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        var out = ""
        try {
            let resp = c.send(HttpRequestBuilder().url("http://127.0.0.1:${port}/expect401")
                .header("Expect", "100-continue").header("Content-Length", "512")
                .body(Array<UInt8>(512, repeat: 0x42)).build())
            out = "status=${resp.status}"
        } catch (e: Exception) { out = "EXC: ${e.message}" }
        c.close()
        listener.close()
        println("[jhc-E1] expect401 => ${out} bodyLeaked=${jBodyAfter401.load()}")
        @Expect(out, "status=401")
        @Expect(jBodyAfter401.load(), false)
    }

    // GREEN: mid-body read timeout closes the connection; next request succeeds cleanly
    @TestCase
    func midBodyTimeoutDiscardsConn(): Unit {
        let (listener, port) = jStartRawServer()
        sleep(Duration.millisecond * 200)
        let c = ClientBuilder().readTimeout(2 * Duration.second).build()
        var out = ""
        try {
            let r1 = c.get("http://127.0.0.1:${port}/halfbody")
            let _ = jBodyOf(r1)
            out = "first=no-timeout"
        } catch (e: Exception) { out = "first=EXC: ${e.message}" }
        try {
            let r2 = c.get("http://127.0.0.1:${port}/echo")
            out += " second=${r2.status}/${jBodyOf(r2)}"
        } catch (e: Exception) { out += " second=EXC: ${e.message}" }
        c.close()
        listener.close()
        println("[jhc-E2] poisoned-conn => ${out}")
        @Expect(out.startsWith("first=EXC"), true)
        @Expect(out.contains("second=200/jok1"), true)
    }
}
