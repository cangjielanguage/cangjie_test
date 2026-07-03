/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test_progress_05

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_01 {
    @TestCase
    public func case_001(): Unit {
        sleep(Duration.second * 2.0)
    }
}

@Test
public class Test_02 {
    @TestCase
    public func case_001(): Unit {
        sleep(Duration.second * 3.0)
    }
}

@Test
public class Test_03 {
    @TestCase
    public func case_001(): Unit {
        sleep(Duration.second * 4.0)
    }
}

@Test
public class Test_04 {
    @TestCase
    public func case_001(): Unit {
        sleep(Duration.second * 5.0)
    }
}

main() {}
