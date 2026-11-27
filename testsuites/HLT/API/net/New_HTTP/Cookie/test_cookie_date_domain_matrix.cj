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
import stdx.encoding.url.*
import std.net.*
import std.io.*
import std.convert.*
import std.collection.*
import std.time.*
import std.sync.*
import std.unittest.*

func cfCookieResponse(setCookieValue: String): HttpResponse {
    return HttpResponseBuilder().status(200)
        .header("set-cookie", setCookieValue)
        .body("ok")
        .build()
}

func cfParseCookie(setCookie: String): (Bool, String, Int64) {
    let resp = cfCookieResponse(setCookie)
    let cookies = CookieJar.parseSetCookieHeader(resp)
    if (cookies.size == 0) { return (false, "no-cookie", 0) }
    let c = cookies[0]
    match (c.expires) {
        case Some(dt) => return (true, dt.toString(), cookies.size)
        case None => return (false, "expires-dropped", cookies.size)
    }
}

// RED (issue 02/F1 extension): date format matrix — RFC 6265 §5.1.1 requires
// case-insensitive, flexible parsing of multiple date formats. stdx ONLY accepts
// exact "GMT"/"UTC" suffix — every other real-world format is silently dropped.
@Test
class CookieDateFormatMatrix {
    @TestCase
    func rfc1123Gmt(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wed, 21 Oct 2015 07:28:00 GMT")
        @Expect(parsed, true)
    }
    @TestCase
    func rfc1123Utc(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wed, 21 Oct 2015 07:28:00 UTC")
        @Expect(parsed, true)
    }
    // RED: lowercase day/month names — RFC 6265 requires case-insensitive parsing
    @TestCase
    func rfc1123Lowercase(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=wed, 21 oct 2015 07:28:00 gmt")
        println("[DF] lowercase: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: uppercase
    @TestCase
    func rfc1123Uppercase(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=WED, 21 OCT 2015 07:28:00 GMT")
        println("[DF] uppercase: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: trailing space
    @TestCase
    func rfc1123TrailingSpace(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wed, 21 Oct 2015 07:28:00 GMT ")
        println("[DF] trailing space: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: leading space
    @TestCase
    func rfc1123LeadingSpace(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires= Wed, 21 Oct 2015 07:28:00 GMT")
        println("[DF] leading space: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: RFC 850 dashes
    @TestCase
    func rfc850Dashes(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wednesday, 21-Oct-2015 07:28:00 GMT")
        println("[DF] rfc850: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: RFC 850 short day name
    @TestCase
    func rfc850ShortDay(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wed, 21-Oct-2015 07:28:00 GMT")
        println("[DF] rfc850 short: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: RFC 850 two-digit year
    @TestCase
    func rfc850TwoDigitYear(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wed, 21-Oct-15 07:28:00 GMT")
        println("[DF] rfc850 2-digit: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: asctime format
    @TestCase
    func asctime(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wed Oct 21 07:28:00 2015")
        println("[DF] asctime: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: asctime without day name
    @TestCase
    func asctimeNoDay(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Oct 21 07:28:00 2015")
        println("[DF] asctime no day: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: no day-of-week prefix
    @TestCase
    func noDayName(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=21 Oct 2015 07:28:00 GMT")
        println("[DF] no day name: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: missing comma after day name
    @TestCase
    func missingComma(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wed 21 Oct 2015 07:28:00 GMT")
        println("[DF] missing comma: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: extra spaces between fields
    @TestCase
    func extraSpaces(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wed,  21  Oct  2015  07:28:00  GMT")
        println("[DF] extra spaces: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: no timezone
    @TestCase
    func noTimezone(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wed, 21 Oct 2015 07:28:00")
        println("[DF] no timezone: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: 2-digit year in RFC 1123 format
    @TestCase
    func twoDigitYear1123(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wed, 21 Oct 15 07:28:00 GMT")
        println("[DF] 2-digit 1123: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: max date
    @TestCase
    func maxDate(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Fri, 31 Dec 9999 23:59:59 GMT")
        println("[DF] max date: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: epoch date
    @TestCase
    func epochDate(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Thu, 01 Jan 1970 00:00:00 GMT")
        println("[DF] epoch: parsed=${parsed}")
        @Expect(parsed, true)
    }
    // RED: no space after comma
    @TestCase
    func noSpaceAfterComma(): Unit {
        let (parsed, _, _) = cfParseCookie("a=1; Expires=Wed,21 Oct 2015 07:28:00 GMT")
        println("[DF] no space comma: parsed=${parsed}")
        @Expect(parsed, true)
    }
}

// Domain matching (mixed pass/fail — one new finding: trailing dot)
@Test
class CookieDomainMatching {
    // GREEN: leading dot matches both domain and subdomain
    @TestCase
    func domainLeadingDot(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookies = CookieJar.parseSetCookieHeader(cfCookieResponse("a=1; Domain=.example.com; Path=/"))
        jar.storeCookies(URL.parse("http://example.com/"), cookies)
        @Expect(jar.getCookies(URL.parse("http://example.com/")).size >= 1, true)
        @Expect(jar.getCookies(URL.parse("http://www.example.com/")).size >= 1, true)
    }
    // GREEN: domain matching is case-insensitive
    @TestCase
    func domainCaseInsensitive(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookies = CookieJar.parseSetCookieHeader(cfCookieResponse("a=1; Domain=EXAMPLE.COM; Path=/"))
        jar.storeCookies(URL.parse("http://example.com/"), cookies)
        @Expect(jar.getCookies(URL.parse("http://EXAMPLE.COM/")).size >= 1, true)
    }
    // GREEN: IP address cookies are host-only
    @TestCase
    func domainIpHostOnly(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookies = CookieJar.parseSetCookieHeader(cfCookieResponse("a=1; Domain=192.168.1.1; Path=/"))
        jar.storeCookies(URL.parse("http://192.168.1.1/"), cookies)
        @Expect(jar.getCookies(URL.parse("http://192.168.1.1/")).size >= 1, true)
    }
    // GREEN: domain cookie matches subdomains
    @TestCase
    func domainSubdomainMatch(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookies = CookieJar.parseSetCookieHeader(cfCookieResponse("a=1; Domain=example.com; Path=/"))
        jar.storeCookies(URL.parse("http://example.com/"), cookies)
        @Expect(jar.getCookies(URL.parse("http://sub.example.com/")).size >= 1, true)
    }
    // GREEN: subdomain cookie does NOT match parent domain
    @TestCase
    func domainParentNotMatch(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookies = CookieJar.parseSetCookieHeader(cfCookieResponse("a=1; Domain=sub.example.com; Path=/"))
        jar.storeCookies(URL.parse("http://sub.example.com/"), cookies)
        @Expect(jar.getCookies(URL.parse("http://example.com/")).size, 0)
    }
    // GREEN: public suffix is rejected
    @TestCase
    func domainPublicSuffix(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(["com"]), true)
        let cookies = CookieJar.parseSetCookieHeader(cfCookieResponse("a=1; Domain=com; Path=/"))
        jar.storeCookies(URL.parse("http://example.com/"), cookies)
        @Expect(jar.getCookies(URL.parse("http://example.com/")).size, 0)
    }
    // GREEN: domain mismatch does not match
    @TestCase
    func domainMismatch(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookies = CookieJar.parseSetCookieHeader(cfCookieResponse("a=1; Domain=other.com; Path=/"))
        jar.storeCookies(URL.parse("http://example.com/"), cookies)
        @Expect(jar.getCookies(URL.parse("http://example.com/")).size, 0)
    }
    // RED (new, F1 supplementary): trailing dot domain should be REJECTED per RFC 6265
    // Current behavior: accepted and matched
    @TestCase
    func domainTrailingDotRejected(): Unit {
        let jar = CookieJar.createDefaultCookieJar(ArrayList<String>(), true)
        let cookies = CookieJar.parseSetCookieHeader(cfCookieResponse("a=1; Domain=example.com.; Path=/"))
        jar.storeCookies(URL.parse("http://example.com/"), cookies)
        let got = jar.getCookies(URL.parse("http://example.com/"))
        println("[DM] trailing dot: got=${got.size} (expect 0)")
        @Expect(got.size, 0)
    }
}
