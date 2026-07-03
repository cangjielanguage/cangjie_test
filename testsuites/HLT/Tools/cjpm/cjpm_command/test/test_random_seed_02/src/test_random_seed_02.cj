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
public class Test_RandomSeed0 {
    @TestCase
    func check_random_seed_zero_from_cjpm(): Unit {
        let config = defaultConfiguration()
        @Expect(config.get<Int64>(KeyRandomSeed.randomSeed), 0)
    }
}

main() {}
