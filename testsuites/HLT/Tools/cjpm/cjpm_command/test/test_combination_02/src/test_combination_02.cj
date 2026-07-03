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
public class Test_ConfigCombo {
    @TestCase
    public func check_random_seed(): Unit {
        let config = defaultConfiguration()
        @Expect(config.get<Int64>(KeyRandomSeed.randomSeed), 42)
    }
    @TestCase
    public func case002(): Unit {
    }
    @TestCase
    public func case003(): Unit {
    }
}

main() {}
