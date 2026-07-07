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
public class Test_IncludeSingle {
    @Tag[Unittest]
    @TestCase
    public func case_unittest_001(): Unit {
    }

    @Tag[Integration]
    @TestCase
    public func case_integration_002(): Unit {
        throw Exception("case should not run")
    }

    @TestCase
    public func case_notag_003(): Unit {
        throw Exception("case should not run")
    }

}

main() {}
