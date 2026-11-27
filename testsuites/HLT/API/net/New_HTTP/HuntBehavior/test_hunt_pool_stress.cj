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

let psAcceptCount = AtomicInt64(0)
let psConnSeq = AtomicInt64(0)

func psHasHeaderEnd(acc: ArrayList<UInt8>): Bool {
    let n = acc.size
    if (n < 4) { return false }
    return acc[n - 4] == 13 && acc[n - 3] == 10 && acc[n - 2] == 13 && acc[n - 1] == 10
}

func psHandleConn(sock: TcpSocket, connId: Int64, live: AtomicInt64): Unit {
    live.fetchAdd(1)
    sock.readTimeout = Duration.second * 20
    try {
        while (true) {
            let acc = ArrayList<UInt8>()
            let tmp = Array<UInt8>(4096, repeat: 0)
            var headerDone = false
            var closed = false
            while (!headerDone) {
                var n = 0
                var err = false
                try { n = sock.read(tmp) } catch (e: Exception) { err = true }
                if (err || n <= 0) { closed = true; break }
                for (i in 0..n) { acc.add(tmp[i]) }
                if (psHasHeaderEnd(acc)) { headerDone = true }
            }
            if (closed) { break }
            let reqStr = String.fromUtf8(acc.toArray())
            var path = "/"
            let bytes = reqStr.toArray()
            var lineEnd = 0
            while (lineEnd < bytes.size && bytes[lineEnd] != 13) { lineEnd += 1 }
            if (lineEnd > 0) {
                let reqLine = String.fromUtf8(bytes[0..lineEnd])
                let parts = reqLine.split(" ")
                if (parts.size >= 2) { path = parts[1] }
            }
            let body = "conn=${connId}|path=${path}"
            let resp = "HTTP/1.1 200 OK\r\nContent-Length: ${body.size}\r\nX-Conn-Id: ${connId}\r\nConnection: keep-alive\r\n\r\n${body}"
            sock.write(resp.toArray())
        }
    } catch (e: Exception) {
        ()
    }
    sock.close()
    live.fetchAdd(-1)
}

func psStartServer(): (TcpServerSocket, Int64, AtomicInt64) {
    let live = AtomicInt64(0)
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
                psAcceptCount.fetchAdd(1)
                let id = psConnSeq.fetchAdd(1) + 1
                spawn { psHandleConn(sock, id, live) }
            } catch (e: Exception) { return }
        }
    }
    return (listener, port, live)
}

func psOneGet(client: Client, port: Int64, tag: String): (String, String) {
    let resp = client.get("http://127.0.0.1:${port}/p?tag=${tag}")
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = resp.body.read(chunk)
        if (n <= 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    let body = String.fromUtf8(buffer.toArray())
    let cid = resp.headers.getFirst("X-Conn-Id") ?? "none"
    return (cid, body)
}

func psWaitDone(okCnt: AtomicInt64, errCnt: AtomicInt64, total: Int64, maxMs: Int64): Unit {
    var waited: Int64 = 0
    while (okCnt.load() + errCnt.load() < total && waited < maxMs) {
        sleep(Duration.millisecond * 25)
        waited += 25
    }
}

func psWaitLiveZero(live: AtomicInt64, maxMs: Int64): Int64 {
    var waited: Int64 = 0
    while (live.load() > 0 && waited < maxMs) {
        sleep(Duration.millisecond * 100)
        waited += 100
    }
    return live.load()
}

@Test
class PsPoolStress {
    @TestCase
    func poolSequentialReuseSingleConn(): Unit {
        psAcceptCount.store(0); psConnSeq.store(0)
        let (listener, port, live) = psStartServer()
        let client = ClientBuilder().poolSize(10).readTimeout(10 * Duration.second).build()
        let ids = ArrayList<String>()
        var errs = 0
        for (i in 0..30) {
            try {
                let (cid, body) = psOneGet(client, port, "ps1-${i}")
                ids.add(cid)
                if (!body.contains("tag=ps1-${i}")) { errs += 1 }
            } catch (e: Exception) { errs += 1 }
        }
        let distinct = ArrayList<String>()
        for (id in ids) {
            var found = false
            for (d in distinct) { if (d == id) { found = true; break } }
            if (!found) { distinct.add(id) }
        }
        client.close()
        listener.close()
        println("[ps] PS1 errs=${errs} accepts=${psAcceptCount.load()} distinctConnIds=${distinct.size}")
        @Expect(errs, 0)
        @Expect(distinct.size, 1)
        @Expect(psAcceptCount.load(), 1)
    }

    @TestCase
    func multiClientConcurrentIsolation(): Unit {
        let (listener, port, live) = psStartServer()
        var clients = ArrayList<Client>()
        for (c in 0..4) { clients.add(ClientBuilder().poolSize(10).readTimeout(10 * Duration.second).build()) }
        let okCnt = AtomicInt64(0)
        let errCnt = AtomicInt64(0)
        let badBody = AtomicInt64(0)
        for (ci in 0..4) {
            let client = clients[ci]
            let cIdx = ci
            for (i in 0..10) {
                let tag = "c${cIdx}r${i}"
                spawn {
                    try {
                        let (_, body) = psOneGet(client, port, tag)
                        if (!body.contains("tag=${tag}")) { badBody.fetchAdd(1) }
                        okCnt.fetchAdd(1)
                    } catch (e: Exception) { errCnt.fetchAdd(1) }
                }
            }
        }
        psWaitDone(okCnt, errCnt, 40, 30000)
        for (c in clients) { c.close() }
        sleep(Duration.millisecond * 500)
        let liveAfterClose = psWaitLiveZero(live, 10000)
        listener.close()
        println("[ps] PS2 ok=${okCnt.load()} err=${errCnt.load()} badBody=${badBody.load()} liveAfterClose=${liveAfterClose}")
        @Expect(okCnt.load(), 40)
        @Expect(errCnt.load(), 0)
        @Expect(badBody.load(), 0)
        @Expect(liveAfterClose, 0)
    }

    @TestCase
    func poolSize8BoundaryRounds(): Unit {
        let (listener, port, live) = psStartServer()
        let client = ClientBuilder().poolSize(8).readTimeout(10 * Duration.second).build()
        var totalErrs: Int64 = 0
        for (r in 0..5) {
            let okCnt = AtomicInt64(0)
            let errCnt = AtomicInt64(0)
            for (i in 0..8) {
                let tag = "p3r${r}i${i}"
                spawn {
                    try { let _ = psOneGet(client, port, tag); okCnt.fetchAdd(1) } catch (e: Exception) { errCnt.fetchAdd(1) }
                }
            }
            psWaitDone(okCnt, errCnt, 8, 20000)
            totalErrs += errCnt.load()
            println("[ps] PS3 round ${r}: ok=${okCnt.load()} err=${errCnt.load()}")
        }
        client.close()
        listener.close()
        println("[ps] PS3 totalErrs=${totalErrs}")
        @Expect(totalErrs, 0)
    }

    @TestCase
    func clientChurnThirtyClean(): Unit {
        let (listener, port, live) = psStartServer()
        var churnErrs = 0
        for (i in 0..30) {
            try {
                let client = ClientBuilder().poolSize(2).readTimeout(10 * Duration.second).build()
                let (_, body) = psOneGet(client, port, "churn-${i}")
                if (!body.contains("tag=churn-${i}")) { churnErrs += 1 }
                client.close()
            } catch (e: Exception) { churnErrs += 1 }
        }
        sleep(Duration.millisecond * 500)
        let liveAfter = psWaitLiveZero(live, 10000)
        listener.close()
        println("[ps] PS4 churnErrs=${churnErrs} liveAfter=${liveAfter}")
        @Expect(churnErrs, 0)
        @Expect(liveAfter, 0)
    }
}
