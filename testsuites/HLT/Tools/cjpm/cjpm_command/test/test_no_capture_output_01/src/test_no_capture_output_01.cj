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
@Parallel
public class Test_NoCapOutput {
    @BeforeEach
    static func setup_beforeeach(): Unit {
        println("setup_beforeeach")
    }

    @AfterEach
    static func setup_aftereach(): Unit {
        println("setup_aftereach")
    }

    @TestCase
    func case001(): Unit {
        println("func case 001 running")
    }

    @TestCase
    func case002(): Unit {
        println("func case 002 running")
    }

    @TestCase
    func case003_fail(): Unit {
        println("func case 003 running")
        @Expect(1, 2)
        throw Exception("func case 003 exception")
    }

}

main() {}
