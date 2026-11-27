/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: helpers
// NOTE: this file MUST be compiled with --cj-pct — it verifies that an
// over-range timeout (more than ~292 years of nanoseconds, past what
// Int64 nanoseconds can express) saturates to an effectively untimed
// virtual deadline instead of letting Duration.toNanoseconds() throw
// ArithmeticException through the mediated condition wait. The same
// wait without --cj-pct runs std's Monitor.wait, which clamps the same
// overflow through its own MAX_TIMEOUT_NS bound — the saturation keeps
// the two paths behaviorally identical.
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt p.%middle --experimental --cj-pct %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 1

import stdx.unittest.concurrent.*
import stdx.concurrent_test_util.*
import std.sync.*

@Test
class PctTimeoutSaturationTests {
    /// A condition wait whose timeout exceeds the Int64-nanosecond range:
    /// the wait must saturate (an effectively untimed virtual deadline),
    /// receive the peer's notify, and complete — not fail the iteration
    /// with ArithmeticException. The flag/while handshake keeps the test
    /// correct in both grant orders (waiter-first parks and is notified;
    /// notifier-first sets the flag so the waiter never parks).
    @TestCase
    func test_pct_timeout_saturation(): Unit {
        println("Testing PCT timeout saturation (over-Int64 range)...")

        let mon = Monitor()
        let flag = AtomicInt64(0)
        let done = AtomicInt64(0)

        let result = scenario("pct_timeout_saturation")
            .mode(PCT)
            .priorityChangePoints(0)
            .iterations(1)
            .pctSeed(20261119u64)
            .actor("waiter") {
                mon.lock()
                while (flag.load() == Int64(0)) {
                    // ~11400 years: past the Int64-nanosecond range.
                    mon.wait(timeout: Duration.hour * 100_000_000)
                }
                done.store(Int64(1))
                mon.unlock()
                0
            }
            .actor("notifier") {
                mon.lock()
                flag.store(Int64(1))
                mon.notify()
                mon.unlock()
                0
            }
            .build()
            .run()

        @Assert(result.passed)
        @Assert(done.load() == Int64(1))
        let reportText = result.report().toString()
        println(reportText)
        @Assert(!reportText.contains("ArithmeticException"))
    }
}
