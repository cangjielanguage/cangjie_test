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
import std.fs.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func hlReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func hlBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(hlReadAll(resp.body))
}

func hlStartSrv(reg: (Server) -> Unit): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    reg(s)
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

@Test
class HuntLifecycle {
    @TestCase
    func halfReadCloseThenReuse(): Unit {
        let s = hlStartSrv({ sv =>
            sv.distributor.register("/big", { ctx => ctx.responseBuilder.body(String.fromUtf8(Array<UInt8>(64 * 1024, repeat: 120))) })
            sv.distributor.register("/next", { ctx => ctx.responseBuilder.body("next-ok") })
        })
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let r1 = c.get("http://127.0.0.1:${s.port}/big")
        let buf = Array<UInt8>(1024, repeat: 0)
        let half = r1.body.read(buf)
        @Expect(half > 0, true)
        r1.close()
        let r2 = c.get("http://127.0.0.1:${s.port}/next")
        @Expect(r2.status, 200)
        @Expect(hlBodyOf(r2), "next-ok")
        c.close(); s.close()
    }

    @TestCase
    func fullReadCloseThenReuse(): Unit {
        let s = hlStartSrv({ sv =>
            sv.distributor.register("/a", { ctx => ctx.responseBuilder.body(String.fromUtf8(Array<UInt8>(32 * 1024, repeat: 65))) })
            sv.distributor.register("/b", { ctx => ctx.responseBuilder.body("b-ok") })
        })
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let r1 = c.get("http://127.0.0.1:${s.port}/a")
        @Expect(hlReadAll(r1.body).size, 32 * 1024)
        r1.close()
        let r2 = c.get("http://127.0.0.1:${s.port}/b")
        @Expect(r2.status, 200)
        @Expect(hlBodyOf(r2), "b-ok")
        c.close(); s.close()
    }

    @TestCase
    func readAfterCloseThrowsAndDoubleCloseSafe(): Unit {
        let s = hlStartSrv({ sv =>
            sv.distributor.register("/x", { ctx => ctx.responseBuilder.body("some-body-data") })
        })
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let r = c.get("http://127.0.0.1:${s.port}/x")
        r.close()
        let buf = Array<UInt8>(64, repeat: 0)
        var threw = false
        try { let _ = r.body.read(buf) } catch (e: Exception) { threw = true }
        @Expect(threw, true)
        r.close()
        c.close(); s.close()
    }

    @TestCase
    func clientCloseInterruptsInflight(): Unit {
        let s = hlStartSrv({ sv =>
            sv.distributor.register("/slow", { ctx =>
                sleep(2 * Duration.second)
                ctx.responseBuilder.body("slow-done")
            })
        })
        let c = ClientBuilder().readTimeout(10 * Duration.second).build()
        let outcome = AtomicInt64(0)
        spawn {
            try {
                let r = c.get("http://127.0.0.1:${s.port}/slow")
                outcome.store(Int64(r.status))
            } catch (e: Exception) {
                outcome.store(-1)
            }
        }
        sleep(Duration.millisecond * 300)
        c.close()
        var waited = 0
        while (outcome.load() == 0 && waited < 30) {
            sleep(Duration.millisecond * 100)
            waited++
        }
        @Expect(outcome.load() != 0, true)
        s.close()
    }

    @TestCase
    func stalePooledConnTransparentlyRetried(): Unit {
        let listener = TcpServerSocket(bindAt: 0)
        listener.bind()
        var port: Int64 = 0
        spawn {
            var conns = 0
            while (true) {
                try {
                    let sock = listener.accept()
                    conns = conns + 1
                    let which = conns
                    spawn {
                        try {
                            let buf = Array<UInt8>(8192, repeat: 0)
                            var head = ""
                            while (true) {
                                let n = sock.read(buf)
                                if (n <= 0) { return }
                                head = head + String.fromUtf8(buf[0..n])
                                if (head.contains("\r\n\r\n")) { break }
                            }
                            if (which == 1) {
                                sock.write("HTTP/1.1 200 OK\r\nContent-Length: 5\r\nconnection: keep-alive\r\n\r\nfirst".toArray())
                                sleep(Duration.millisecond * 100)
                                sock.close()
                            } else {
                                sock.write("HTTP/1.1 200 OK\r\nContent-Length: 6\r\nconnection: close\r\n\r\nsecond".toArray())
                                sock.close()
                            }
                        } catch (e: Exception) { () }
                    }
                } catch (e: Exception) { return }
            }
        }
        while (port == 0) {
            sleep(Duration.millisecond)
            let t = listener.localAddress.toString()
            match (t.lastIndexOf(":")) {
                case Some(i) => port = Int64.parse(t[i + 1..])
                case None => ()
            }
        }
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()
        let r1 = c.get("http://127.0.0.1:${port}/")
        @Expect(r1.status, 200)
        @Expect(hlBodyOf(r1), "first")
        sleep(Duration.millisecond * 200)
        var ok = false
        var detail = ""
        try {
            let r2 = c.get("http://127.0.0.1:${port}/")
            ok = r2.status == 200 && hlBodyOf(r2) == "second"
        } catch (e: Exception) {
            detail = "${e}"
        }
        println("[hunt-lc] stale pooled conn retry: ok=${ok} ${detail}")
        @Expect(ok, true)
        c.close(); listener.close()
    }

    @TestCase
    func uploadOverwriteBehavior(): Unit {
        try { Directory.create("fh_up") } catch (e: Exception) { () }
        let seed = File("fh_up/existing.txt", Write)
        seed.write("ORIGINAL-CONTENT".toArray().map({ b => UInt8(b) }))
        seed.close()

        let s = hlStartSrv({ sv =>
            sv.distributor.register("/up", FileHandler("fh_up/", handlerType: UpLoad))
        })
        let c = ClientBuilder().readTimeout(5 * Duration.second).build()

        let boundary = "----HuntFH"
        let body = StringBuilder()
        body.append("--${boundary}\r\n")
        body.append("Content-Disposition: form-data; name=\"myFile\"; filename=\"existing.txt\"\r\n\r\n")
        body.append("NEW-UPLOADED\r\n")
        body.append("--${boundary}--\r\n")
        let r = c.send(HttpRequestBuilder().url("http://127.0.0.1:${s.port}/up").header("content-type", "multipart/form-data; boundary=${boundary}").body(body.toString()).post().build())
        println("[hunt-lc] upload-overwrite status=${r.status}")

        let bodyText = hlBodyOf(r)
        var ok = false
        if (r.status == 200) {
            let f = File("fh_up/existing.txt", Read)
            let content = String.fromUtf8(hlReadAll(f))
            f.close()
            ok = content.contains("NEW-UPLOADED")
            println("[hunt-lc] after-overwrite file=[${content}]")
        } else {
            ok = r.status >= 400 && r.status < 500
            println("[hunt-lc] non-200 status=${r.status} (4xx accepted as explicit rejection)")
        }
        println("[hunt-lc] upload-overwrite: status=${r.status} ok=${ok} resp=[${bodyText}]")
        @Expect(ok, true)
        c.close(); s.close()
    }
}
