/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: helpers
// NOTE: verifies that the default Stress mode reports a user exception
// thrown by an operation: the exception is captured as the operation's
// recorded result, surfaces as the actor row's failure, and fails the
// run — the same finding semantics as the PCT/DPOR paths. Stress used
// to construct the actor result without the exception, so a scenario
// whose operations (always) throw PASSED silently in the default mode.
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt p.%middle %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 1

// ASSERT: scan IllegalArgumentException
// ASSERT: scan stress user boom

import stdx.unittest.concurrent.*
import std.sync.AtomicInt64

@Test
class StressUserExceptionTests {
    /// An operation that always throws: under the default Stress mode the
    /// captured exception must ride the actor result (visible in the
    /// report) and fail the iteration — matching PCT/DPOR. The operation
    /// after the throwing one still runs: the throw is a recorded result,
    /// not an actor abort.
    @TestCase
    func test_stress_user_exception_fails(): Unit {
        println("Testing Stress user exception (operation always throws)...")

        let ran = AtomicInt64(0)
        let result = scenario("stress_user_exception")
            .actorWithOps([
                operation<Int64>("always_throws") {
                    ran.fetchAdd(1)
                    throw IllegalArgumentException("stress user boom")
                },
                operation<Int64>("after_boom") {
                    ran.fetchAdd(1)
                    0
                }
            ])
            .iterations(3)
            .build()
            .run()

        @Assert(!result.passed)
        // The throwing operation ran (its exception is a recorded result,
        // not an actor abort); parallel dispatch may stop early after the
        // failing iteration, so only presence is asserted.
        @Assert(ran.load() >= Int64(1))
        let reportText = result.report().toString()
        println(reportText)
        @Assert(reportText.contains("IllegalArgumentException"))
        @Assert(reportText.contains("stress user boom"))
    }
}
