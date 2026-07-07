/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_ExcludeAnd {
    @Tag[Unittest]
    @Tag[Smoke]
    @TestCase
    public func case_both_001(): Unit {
        throw Exception("TAG_FILTER_ERROR: case_both_001 should have been excluded by AND logic")
    }

    @Tag[Unittest]
    @TestCase
    public func case_unittest_only_002(): Unit {
        println("TEST_OUTPUT: case_unittest_only_002 executed")
    }

    @Tag[Smoke]
    @TestCase
    public func case_smoke_only_003(): Unit {
        println("TEST_OUTPUT: case_smoke_only_003 executed")
    }

    @TestCase
    public func case_notag_004(): Unit {
        println("TEST_OUTPUT: case_notag_004 executed")
    }

}

main() {}
