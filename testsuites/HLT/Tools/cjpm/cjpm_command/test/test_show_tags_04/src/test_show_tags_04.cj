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
@Tag[Unittest]
public class Test_FilterShowTags {
    @Tag[Unittest]
    @TestCase
    public func caseTaggedTest_001(): Unit {
    }

    @Tag[Integration]
    @TestCase
    public func caseOther_002(): Unit {
    }

}

main() {}
