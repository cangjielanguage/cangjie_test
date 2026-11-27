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

const AC_BASIC = "Basic realm=\"hunt\", charset=\"UTF-8\""
const AC_DIGEST = "Digest realm=\"hunt\", qop=\"auth,auth-int\", nonce=\"dcd98b7102dd2f0e8b11d0f600bfb0c093\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\", algorithm=SHA-256, userhash=true"

func acReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(8192, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func acBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(acReadAll(resp.body))
}

func acFirstChallenge(resp: HttpResponse): String {
    for ((name, values) in resp.headers) {
        if (name == "WWW-Authenticate" || name == "www-authenticate") {
            for (v in values) { return v }
        }
    }
    return "absent"
}

func acStartSrv(): Server {
    let s = ServerBuilder().addr("127.0.0.1").port(0).build()
    s.distributor.register("/401basic", { ctx =>
        ctx.responseBuilder.status(401).header("WWW-Authenticate", AC_BASIC).body("creds-required")
    })
    s.distributor.register("/401digest", { ctx =>
        ctx.responseBuilder.status(401).header("WWW-Authenticate", AC_DIGEST).body("creds-required")
    })
    s.distributor.register("/echoauth", { ctx =>
        let auth = ctx.request.headers.getFirst("authorization") ?? "-"
        ctx.responseBuilder.body("auth=[${auth}]")
    })
    s.distributor.register("/chal-echo", { ctx =>
        let chal = ctx.request.headers.getFirst("x-challenge") ?? "none"
        ctx.responseBuilder.status(401).header("WWW-Authenticate", chal).body("challenge-echo")
    })
    spawn { s.serve() }
    while (s.port == 0) { sleep(Duration.millisecond) }
    return s
}

func acStartProxy407(): (TcpServerSocket, Int64) {
    let listener = TcpServerSocket(bindAt: 0)
    listener.bind()
    spawn {
        while (true) {
            try {
                let sock = listener.accept()
                spawn {
                    try {
                        let buf = Array<UInt8>(8192, repeat: 0)
                        var head = ""
                        while (!head.contains("\r\n\r\n")) {
                            let n = sock.read(buf)
                            if (n <= 0) { break }
                            head = head + String.fromUtf8(buf[0..n])
                        }
                        sock.write("HTTP/1.1 407 Proxy Authentication Required\r\nProxy-Authenticate: Basic realm=\"hunt-proxy\"\r\nContent-Length: 0\r\n\r\n".toArray())
                        sleep(Duration.millisecond * 100)
                        sock.close()
                    } catch (e: Exception) { () }
                }
            } catch (e: Exception) { return }
        }
    }
    var port: Int64 = 0
    while (port == 0) {
        sleep(Duration.millisecond)
        let t = listener.localAddress.toString()
        match (t.lastIndexOf(":")) {
            case Some(i) => port = Int64.parse(t[i + 1..])
            case None => ()
        }
    }
    return (listener, port)
}

@Test
class HuntAuthChallenge {
    @TestCase
    func ac01_basicChallengeByteExact(): Unit {
        let s = acStartSrv()
        let port = Int64(s.port)
        let c = ClientBuilder().readTimeout(4 * Duration.second).build()
        let resp = c.get("http://127.0.0.1:${port}/401basic")
        let got = acFirstChallenge(resp)
        let body = acBodyOf(resp)
        c.close()
        s.close()
        @Expect(resp.status, 401)
        @Expect(got, AC_BASIC)
        @Expect(body.contains("creds-required"), true)
    }

    @TestCase
    func ac02_digestChallengeByteExact(): Unit {
        let s = acStartSrv()
        let port = Int64(s.port)
        let c = ClientBuilder().readTimeout(4 * Duration.second).build()
        let resp = c.get("http://127.0.0.1:${port}/401digest")
        let got = acFirstChallenge(resp)
        c.close()
        s.close()
        @Expect(resp.status, 401)
        @Expect(got, AC_DIGEST)
    }

    @TestCase
    func ac03_challengeRoundtrip(): Unit {
        let s = acStartSrv()
        let port = Int64(s.port)
        let c = ClientBuilder().readTimeout(4 * Duration.second).build()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${port}/chal-echo")
            .header("X-Challenge", AC_DIGEST).build()
        let resp = c.send(req)
        let got = acFirstChallenge(resp)
        c.close()
        s.close()
        @Expect(resp.status, 401)
        @Expect(got, AC_DIGEST)
    }

    @TestCase
    func ac04_authorizationToken68Roundtrip(): Unit {
        let s = acStartSrv()
        let port = Int64(s.port)
        let c = ClientBuilder().readTimeout(4 * Duration.second).build()
        let req = HttpRequestBuilder().url("http://127.0.0.1:${port}/echoauth")
            .header("Authorization", "Bearer mF_9.B5f-4.1JqM==").build()
        let resp = c.send(req)
        let body = acBodyOf(resp)
        c.close()
        s.close()
        @Expect(resp.status, 200)
        @Expect(body, "auth=[Bearer mF_9.B5f-4.1JqM==]")
    }

    @TestCase
    func ac05_proxy407ChallengeReadable(): Unit {
        let (proxy, pport) = acStartProxy407()
        let c = ClientBuilder().httpProxy("http://127.0.0.1:${pport}")
            .readTimeout(4 * Duration.second).build()
        var statusText = "?"
        var chal = "absent"
        try {
            let resp = c.get("http://127.0.0.1:1/")
            statusText = "${resp.status}"
            chal = resp.headers.getFirst("Proxy-Authenticate") ?? "absent"
        } catch (e: Exception) {
            println("[AC05] EXC: ${e}")
        }
        c.close()
        proxy.close()
        @Expect(statusText, "407")
        @Expect(chal, "Basic realm=\"hunt-proxy\"")
    }
}
