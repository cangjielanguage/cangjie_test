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
@Tag[Integration]
public class Test_XmlTags {
    @Tag[Integration]
    @TestCase
    public func case_integration_001(): Unit {
    }

    @TestCase
    public func case_normal_002(): Unit {
    }

}

main() {}
