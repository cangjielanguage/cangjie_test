/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt --parallel=false

import stdx.encoding.url.*
import std.unittest.*
import std.collection.*

@Test
class HuntUrlWhatwg {
    @TestCase
    func pathPercentEncodingPreserved(): Unit {
        let u = URL.parse("http://x/%2F%2E%2E")
        @Expect(u.path, "/%2F%2E%2E")
    }

    @TestCase
    func pathEmptySegmentPreserved(): Unit {
        let u = URL.parse("http://x/a//b")
        @Expect(u.path, "/a//b")
    }

    @TestCase
    func mailtoOpaquePathPreserved(): Unit {
        let u = URL.parse("mailto:user@example.com")
        @Expect(u.path, "user@example.com")
    }

    @TestCase
    func querySpaceEncoded(): Unit {
        let u = URL.parse("http://x/?a=b c")
        var q = "-"
        match (u.rawQuery) {
            case Some(qs) => q = qs
            case None => q = "-"
        }
        @Expect(q, "a=b%20c")
    }

    @TestCase
    func ipv4Int32HostNormalized(): Unit {
        let u = URL.parse("http://2130706433/")
        @Expect(u.host, "127.0.0.1")
    }

    @TestCase
    func ipv4HexHostNormalized(): Unit {
        let u = URL.parse("http://0x7f.1/")
        @Expect(u.host, "127.0.1")
    }

    @TestCase
    func emptyHostSpecialSchemeFails(): Unit {
        var threw1 = false
        try {
            let u = URL.parse("http:///a")
            ()
        } catch (e: Exception) {
            threw1 = true
        }
        @Expect(threw1, true)
        var threw2 = false
        try {
            let u = URL.parse("http://:80/")
            ()
        } catch (e: Exception) {
            threw2 = true
        }
        @Expect(threw2, true)
    }
}
