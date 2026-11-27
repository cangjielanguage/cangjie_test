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

func fpReadAll(stream: InputStream): Array<UInt8> {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(8192, repeat: 0)
    while (true) {
        let n = stream.read(chunk)
        if (n == 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return buffer.toArray()
}

func fpBodyOf(resp: HttpResponse): String {
    return String.fromUtf8(fpReadAll(resp.body))
}

func fpDrainRequest(sock: TcpSocket): Unit {
    let buf = Array<UInt8>(8192, repeat: 0)
    var head = ""
    while (!head.contains("\r\n\r\n")) {
        let n = sock.read(buf)
        if (n <= 0) { return }
        head = head + String.fromUtf8(buf[0..n])
    }
}

func fpStartScripted(responses: Array<String>): (TcpServerSocket, Int64) {
    let listener = TcpServerSocket(bindAt: 0)
    listener.bind()
    spawn {
        while (true) {
            try {
                let sock = listener.accept()
                spawn {
                    try {
                        for (r in responses) {
                            fpDrainRequest(sock)
                            sock.write(r.toArray())
                            sleep(Duration.millisecond * 200)
                        }
                        sleep(Duration.millisecond * 900)
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

func fpStartEof(response: String): (TcpServerSocket, Int64) {
    let listener = TcpServerSocket(bindAt: 0)
    listener.bind()
    spawn {
        while (true) {
            try {
                let sock = listener.accept()
                spawn {
                    try {
                        fpDrainRequest(sock)
                        sock.write(response.toArray())
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

func fpCleanSecond(): String {
    return "HTTP/1.1 200 OK\r\nContent-Length: 9\r\n\r\nsecond-ok"
}

@Test
class HuntFramingPositive {
    @TestCase
    func fp01_headWithContentLengthNoBody(): Unit {
        let (listener, port) = fpStartScripted([
            "HTTP/1.1 200 OK\r\nContent-Length: 100\r\n\r\n",
            fpCleanSecond()])
        let client = ClientBuilder().readTimeout(4 * Duration.second).build()
        var statusText = "?"
        var body = ""
        var err = ""
        try {
            let r1 = client.send(HttpRequestBuilder().method("HEAD")
                .url("http://127.0.0.1:${port}/x").build())
            statusText = "${r1.status}"
            body = fpBodyOf(r1)
            let r2 = client.get("http://127.0.0.1:${port}/y")
            body = body + " | 2nd=" + fpBodyOf(r2)
        } catch (e: Exception) {
            err = "${e}"
        }
        client.close()
        listener.close()
        @Expect(err, "")
        @Expect(statusText, "200")
        @Expect(body, " | 2nd=second-ok")
    }

    @TestCase
    func fp02_204StaleContentLengthNoBody(): Unit {
        let (listener, port) = fpStartScripted([
            "HTTP/1.1 204 No Content\r\nContent-Length: 5\r\n\r\n",
            fpCleanSecond()])
        let client = ClientBuilder().readTimeout(4 * Duration.second).build()
        var statusText = "?"
        var err = ""
        try {
            let r1 = client.get("http://127.0.0.1:${port}/x")
            statusText = "${r1.status}"
        } catch (e: Exception) {
            err = "${e}"
        }
        client.close()
        listener.close()
        @Expect(err, "")
        @Expect(statusText, "204")
    }

    @TestCase
    func fp03_304StaleContentLengthNoBody(): Unit {
        let (listener, port) = fpStartScripted([
            "HTTP/1.1 304 Not Modified\r\nETag: \"v1\"\r\nContent-Length: 5\r\n\r\n",
            fpCleanSecond()])
        let client = ClientBuilder().readTimeout(4 * Duration.second).build()
        var statusText = "?"
        var etag = ""
        var err = ""
        try {
            let r1 = client.get("http://127.0.0.1:${port}/x")
            statusText = "${r1.status}"
            etag = r1.headers.getFirst("etag") ?? "absent"
        } catch (e: Exception) {
            err = "${e}"
        }
        client.close()
        listener.close()
        @Expect(err, "")
        @Expect(statusText, "304")
        @Expect(etag, "\"v1\"")
    }

    @TestCase
    func fp04_eofDelimitedBody(): Unit {
        let (listener, port) = fpStartEof("HTTP/1.1 200 OK\r\n\r\nno-length-body")
        let client = ClientBuilder().readTimeout(4 * Duration.second).build()
        var body = ""
        var err = ""
        try {
            let r = client.get("http://127.0.0.1:${port}/x")
            body = fpBodyOf(r)
        } catch (e: Exception) {
            err = "${e}"
        }
        client.close()
        listener.close()
        @Expect(err, "")
        @Expect(body, "no-length-body")
    }
}
