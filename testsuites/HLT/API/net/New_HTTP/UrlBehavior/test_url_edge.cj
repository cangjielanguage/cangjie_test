/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt --parallel=false

import stdx.encoding.url.*
import std.unittest.*

@Test
class UrlEdgeTest {
    @TestCase
    func defaultPathSlash(): Unit {
        let u = URL.parse("http://example.com")
        @Expect(u.path, "")
    }
    @TestCase
    func ipv6HostWithBrackets(): Unit {
        let u = URL.parse("http://[::1]:8080/a")
        @Expect(u.host.contains("::1"), true)
        @Expect(u.path, "/a")
    }
    @TestCase
    func queryPercentPreserved(): Unit {
        let u = URL.parse("http://x/?a=%2B1")
        @Expect(u.rawQuery, "a=%2B1")
    }
    @TestCase
    func fragmentSeparated(): Unit {
        let u = URL.parse("http://x/a#frag")
        @Expect(u.path, "/a")
        @Expect(u.fragment, "frag")
        @Expect(u.rawQuery == None<String>, true)
    }
    @TestCase
    func explicitPortPreserved(): Unit {
        let u = URL.parse("http://x:8080/a")
        @Expect(u.port, "8080")
        @Expect(u.host != "", true)
    }
    @TestCase
    func queryFormGet(): Unit {
        let u = URL.parse("http://x/?a=1&b=2")
        @Expect(u.queryForm.get("a") ?? "missing", "1")
        @Expect(u.queryForm.get("b") ?? "missing", "2")
    }
    @TestCase
    func decodeComponentSemantics(): Unit {
        @Expect(URL.decodeComponent("a%2Bb%20c"), "a+b c")
    }
    @TestCase
    func encodeComponentSpace(): Unit {
        @Expect(URL.encodeComponent("a b"), "a%20b")
    }
    @TestCase
    func parseWithEmptyQuery(): Unit {
        let u = URL.parse("http://x/a?")
        @Expect(u.path, "/a")
    }
}
