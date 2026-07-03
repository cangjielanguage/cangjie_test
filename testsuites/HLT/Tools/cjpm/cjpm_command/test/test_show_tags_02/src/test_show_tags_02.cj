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
@Tag[Smoke]
public class Test_DryRunTag {
    @Tag[Unittest]
    @TestCase
    public func case_tagged_001(): Unit {
    }

    @Tag[Smoke]
    @TestCase
    public func case_tagged_002(): Unit {
    }

}

main() {}
