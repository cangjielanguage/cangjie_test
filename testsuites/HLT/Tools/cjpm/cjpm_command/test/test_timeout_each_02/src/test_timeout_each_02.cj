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
public class Test_Timeout500ms {
    @TestCase
    public func case_fast(): Unit {
    }

    @TestCase
    public func case_slow(): Unit {
        // Busy wait to exceed 500ms timeout
        var i: Int64 = 0
        while (i < 2000000000) {
            i += 1
        }
    }
}

main() {}
