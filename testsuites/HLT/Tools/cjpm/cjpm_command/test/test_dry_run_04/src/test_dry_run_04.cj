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
public class Test_FilterDryRun {
    @TestCase
    public func caseTest001(): Unit {
    }

    @TestCase
    public func caseTest002(): Unit {
    }

    @TestCase
    public func caseOther003(): Unit {
    }

    @TestCase
    public func caseOther004(): Unit {
    }
}

main() {}
