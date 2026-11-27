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
import stdx.crypto.digest.*
import stdx.encoding.hex.*
import std.net.*
import std.io.*
import std.convert.*
import std.collection.*
import std.time.*
import std.sync.*
import stdx.encoding.url.*
import std.unittest.*

func cbResp(setCookieValues: Array<String>): HttpResponse {
    let builder = HttpResponseBuilder().status(200)
    for (value in setCookieValues) {
        builder.header("Set-Cookie", value)
    }
    return builder.build()
}

func cbStore(url: String, setCookie: String): Int64 {
    let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
    let cookies = CookieJar.parseSetCookieHeader(cbResp([setCookie]))
    jar.storeCookies(URL.parse(url), cookies)
    return Int64(jar.getCookies(URL.parse(url)).size)
}

func cbReadBody(r: HttpResponse): String {
    let buffer = ArrayList<UInt8>()
    let chunk = Array<UInt8>(4096, repeat: 0)
    while (true) {
        let n = r.body.read(chunk)
        if (n <= 0) { break }
        for (i in 0..n) { buffer.add(chunk[i]) }
    }
    return String.fromUtf8(buffer.toArray())
}

func dMd5Hex(s: String): String {
    let m = MD5()
    m.write(s.toArray())
    return toHexString(m.finish())
}

func dSha256Hex(s: String): String {
    let m = SHA256()
    m.write(s.toArray())
    return toHexString(m.finish())
}

func dTrim(s: String): String {
    return s.trimStart({ x: Rune => x == r' ' }).trimEnd({ x: Rune => x == r' ' })
}

func dParseChallenge(header: String): HashMap<String, String> {
    let map = HashMap<String, String>()
    var body = header
    if (header.startsWith("Digest ")) { body = header[7..] }
    let parts = body.split(",")
    for (p in parts) {
        let kv = dTrim(p)
        let eqOpt = kv.indexOf("=")
        match (eqOpt) {
            case Some(eq) =>
                if (eq > 0) {
                    map.add(dTrim(kv[0..eq]), dTrim(kv[eq + 1..]))
                }
            case None => ()
        }
    }
    return map
}

func dExpected(user: String, pass: String, realm: String, method: String, uri: String,
    useSha256: Bool, nonce: String, qop: String, nc: String, cnonce: String): String {
    let a1 = "${user}:${realm}:${pass}"
    let ha1 = if (useSha256) { dSha256Hex(a1) } else { dMd5Hex(a1) }
    let ha2 = if (useSha256) { dSha256Hex("${method}:${uri}") } else { dMd5Hex("${method}:${uri}") }
    if (qop != "") {
        if (useSha256) { return dSha256Hex("${ha1}:${nonce}:${nc}:${cnonce}:${qop}:${ha2}") }
        return dMd5Hex("${ha1}:${nonce}:${nc}:${cnonce}:${qop}:${ha2}")
    }
    if (useSha256) { return dSha256Hex("${ha1}:${nonce}:${ha2}") }
    return dMd5Hex("${ha1}:${nonce}:${ha2}")
}

func dValidate(auth: String, useSha256: Bool): Bool {
    let respHash = dExtractField(auth, "response")
    if (respHash == "") { return false }
    let nonce = dExtractField(auth, "nonce")
    let nc = dExtractField(auth, "nc")
    let cnonce = dExtractField(auth, "cnonce")
    var qop = ""
    if (auth.contains("qop=")) { qop = "auth" }
    let expect = dExpected("Mufasa", "Circle Of Life", "testrealm@hunt", "GET", "/digest",
        useSha256, nonce, qop, nc, cnonce)
    return respHash == expect
}

func dExtractField(auth: String, field: String): String {
    let segs = auth.split(",")
    for (seg in segs) {
        let kv = dTrim(seg)
        if (kv.startsWith("${field}=")) {
            var v = dTrim(kv[(field.size + 1)..])
            if (v.startsWith("\"") && v.endsWith("\"") && v.size >= 2) { v = v[1..v.size - 1] }
            return v
        }
    }
    return ""
}

func dChallenge(useSha256: Bool, qop: Bool): String {
    var ch = "Digest realm=\"testrealm@hunt\", nonce=\"dcd98b7102dd2f0e8b11d0f600bfb0c093\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\""
    if (qop) { ch += ", qop=\"auth\"" }
    if (useSha256) { ch += ", algorithm=SHA-256" }
    return ch
}

@Test
class CookieJarGaps {
    // RED (issue 58): public-suffix Domain cookies must be rejected (bis §5.5 / PSL)
    @TestCase
    func publicSuffixDomainRejected(): Unit {
        let n1 = cbStore("http://foo.com/", "a=1; Domain=com; Path=/")
        let n2 = cbStore("http://foo.co.uk/", "a=1; Domain=co.uk; Path=/")
        let n3 = cbStore("http://test.github.io/", "a=1; Domain=github.io; Path=/")
        println("[cb58-C1] PSL Domain=com=${n1} co.uk=${n2} github.io=${n3}")
        @Expect(n1, 0)
        @Expect(n2, 0)
        @Expect(n3, 0)
    }

    // RED (issue 59): doc says 50 cookies per domain with oldest-evicted policy
    @TestCase
    func perDomainLimitEnforced(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        for (i in 0..60) {
            let cookies = CookieJar.parseSetCookieHeader(cbResp(["n${i}=v${i}; Path=/"]))
            jar.storeCookies(URL.parse("http://evict.test/"), cookies)
        }
        let survivors = jar.getCookies(URL.parse("http://evict.test/"))
        println("[cb59-C5] stored=60 survivors=${survivors.size}")
        @Expect(survivors.size <= 50, true)
    }

    // GREEN: localhost Secure cookie is NOT sent over http (strict-secure design choice)
    @TestCase
    func localhostSecureStrict(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookies = CookieJar.parseSetCookieHeader(cbResp(["a=1; Secure; Path=/"]))
        jar.storeCookies(URL.parse("http://localhost:8080/"), cookies)
        let n = Int64(jar.getCookies(URL.parse("http://localhost:8080/")).size)
        println("[cb-C4] localhost Secure send-count=${n}")
        @Expect(n, 0)
    }
}

@Test
class DigestFlow {
    // GREEN: md5 + qop=auth full 401->compute->retry flow
    @TestCase
    func digestMd5QopEndToEnd(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/digest", { ctx =>
            let auth = ctx.request.headers.getFirst("Authorization") ?? ""
            if (dValidate(auth, false)) {
                ctx.responseBuilder.status(200).body("digest-ok")
            } else {
                ctx.responseBuilder.status(401).header("WWW-Authenticate", dChallenge(false, true)).body("need-auth")
            }
        })
        spawn { s.serve() }
        while (s.port == 0) { sleep(Duration.millisecond) }
        let client = ClientBuilder().readTimeout(5 * Duration.second).build()
        var out = ""
        try {
            let r1 = client.get("http://127.0.0.1:${Int64(s.port)}/digest")
            let map = dParseChallenge(r1.headers.getFirst("WWW-Authenticate") ?? "")
            let nonce = map.get("nonce") ?? ""
            let opaque = map.get("opaque") ?? ""
            let ha1 = dMd5Hex("Mufasa:testrealm@hunt:Circle Of Life")
            let ha2 = dMd5Hex("GET:/digest")
            let respHash = dMd5Hex("${ha1}:${nonce}:00000001:0a4f113b:auth:${ha2}")
            let auth = "Digest username=\"Mufasa\", realm=\"testrealm@hunt\", nonce=\"${nonce}\", uri=\"/digest\", qop=auth, nc=00000001, cnonce=\"0a4f113b\", response=\"${respHash}\", opaque=\"${opaque}\""
            let r2 = client.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/digest")
                .header("Authorization", auth).build())
            out = "retry=${r2.status}/${cbReadBody(r2)}"
        } catch (e: Exception) { out = "EXC: ${e.message}" }
        client.close()
        s.close()
        println("[cb-D1] md5+qop => ${out}")
        @Expect(out, "retry=200/digest-ok")
    }

    // GREEN: sha-256 algorithm challenge flow
    @TestCase
    func digestSha256EndToEnd(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/digest", { ctx =>
            let auth = ctx.request.headers.getFirst("Authorization") ?? ""
            if (dValidate(auth, true)) {
                ctx.responseBuilder.status(200).body("digest-ok")
            } else {
                ctx.responseBuilder.status(401).header("WWW-Authenticate", dChallenge(true, true)).body("need-auth")
            }
        })
        spawn { s.serve() }
        while (s.port == 0) { sleep(Duration.millisecond) }
        let client = ClientBuilder().readTimeout(5 * Duration.second).build()
        var out = ""
        try {
            let r1 = client.get("http://127.0.0.1:${Int64(s.port)}/digest")
            let map = dParseChallenge(r1.headers.getFirst("WWW-Authenticate") ?? "")
            let nonce = map.get("nonce") ?? ""
            let opaque = map.get("opaque") ?? ""
            let algoField = map.get("algorithm") ?? "absent"
            let ha1 = dSha256Hex("Mufasa:testrealm@hunt:Circle Of Life")
            let ha2 = dSha256Hex("GET:/digest")
            let respHash = dSha256Hex("${ha1}:${nonce}:00000001:0a4f113b:auth:${ha2}")
            let auth = "Digest username=\"Mufasa\", realm=\"testrealm@hunt\", nonce=\"${nonce}\", uri=\"/digest\", algorithm=SHA-256, qop=auth, nc=00000001, cnonce=\"0a4f113b\", response=\"${respHash}\", opaque=\"${opaque}\""
            let r2 = client.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/digest")
                .header("Authorization", auth).build())
            out = "algo=${algoField} retry=${r2.status}/${cbReadBody(r2)}"
        } catch (e: Exception) { out = "EXC: ${e.message}" }
        client.close()
        s.close()
        println("[cb-D2] sha-256 => ${out}")
        @Expect(out, "algo=SHA-256 retry=200/digest-ok")
    }

    // GREEN: legacy RFC 2069 (no qop) flow
    @TestCase
    func digestLegacyNoQop(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/digest", { ctx =>
            let auth = ctx.request.headers.getFirst("Authorization") ?? ""
            if (dValidate(auth, false)) {
                ctx.responseBuilder.status(200).body("digest-ok")
            } else {
                ctx.responseBuilder.status(401).header("WWW-Authenticate", dChallenge(false, false)).body("need-auth")
            }
        })
        spawn { s.serve() }
        while (s.port == 0) { sleep(Duration.millisecond) }
        let client = ClientBuilder().readTimeout(5 * Duration.second).build()
        var out = ""
        try {
            let r1 = client.get("http://127.0.0.1:${Int64(s.port)}/digest")
            let map = dParseChallenge(r1.headers.getFirst("WWW-Authenticate") ?? "")
            let nonce = map.get("nonce") ?? ""
            let opaque = map.get("opaque") ?? ""
            let ha1 = dMd5Hex("Mufasa:testrealm@hunt:Circle Of Life")
            let ha2 = dMd5Hex("GET:/digest")
            let respHash = dMd5Hex("${ha1}:${nonce}:${ha2}")
            let auth = "Digest username=\"Mufasa\", realm=\"testrealm@hunt\", nonce=\"${nonce}\", uri=\"/digest\", response=\"${respHash}\", opaque=\"${opaque}\""
            let r2 = client.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/digest")
                .header("Authorization", auth).build())
            out = "retry=${r2.status}/${cbReadBody(r2)}"
        } catch (e: Exception) { out = "EXC: ${e.message}" }
        client.close()
        s.close()
        println("[cb-D3] legacy-noqop => ${out}")
        @Expect(out, "retry=200/digest-ok")
    }

    // GREEN: nonce reuse with incremented nc counter
    @TestCase
    func digestNcReuse(): Unit {
        let s = ServerBuilder().addr("127.0.0.1").port(0).build()
        s.distributor.register("/digest", { ctx =>
            let auth = ctx.request.headers.getFirst("Authorization") ?? ""
            if (dValidate(auth, false)) {
                ctx.responseBuilder.status(200).body("digest-ok")
            } else {
                ctx.responseBuilder.status(401).header("WWW-Authenticate", dChallenge(false, true)).body("need-auth")
            }
        })
        spawn { s.serve() }
        while (s.port == 0) { sleep(Duration.millisecond) }
        let client = ClientBuilder().readTimeout(5 * Duration.second).build()
        var out = ""
        try {
            let r1 = client.get("http://127.0.0.1:${Int64(s.port)}/digest")
            let map = dParseChallenge(r1.headers.getFirst("WWW-Authenticate") ?? "")
            let nonce = map.get("nonce") ?? ""
            let opaque = map.get("opaque") ?? ""
            let ha1 = dMd5Hex("Mufasa:testrealm@hunt:Circle Of Life")
            let ha2 = dMd5Hex("GET:/digest")
            let auth1 = "Digest username=\"Mufasa\", realm=\"testrealm@hunt\", nonce=\"${nonce}\", uri=\"/digest\", qop=auth, nc=00000001, cnonce=\"0a4f113b\", response=\"${dMd5Hex("${ha1}:${nonce}:00000001:0a4f113b:auth:${ha2}")}\", opaque=\"${opaque}\""
            let r2 = client.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/digest")
                .header("Authorization", auth1).build())
            let auth2 = "Digest username=\"Mufasa\", realm=\"testrealm@hunt\", nonce=\"${nonce}\", uri=\"/digest\", qop=auth, nc=00000002, cnonce=\"0a4f113b\", response=\"${dMd5Hex("${ha1}:${nonce}:00000002:0a4f113b:auth:${ha2}")}\", opaque=\"${opaque}\""
            let r3 = client.send(HttpRequestBuilder().url("http://127.0.0.1:${Int64(s.port)}/digest")
                .header("Authorization", auth2).build())
            out = "nc1=${r2.status} nc2=${r3.status}"
        } catch (e: Exception) { out = "EXC: ${e.message}" }
        client.close()
        s.close()
        println("[cb-D4] nc-reuse => ${out}")
        @Expect(out, "nc1=200 nc2=200")
    }
}
