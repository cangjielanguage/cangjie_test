/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: helpers
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt p.%middle --experimental --cj-pct %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 2

import stdx.unittest.concurrent.*
import stdx.concurrent_test_util.*
import std.sync.*

@Test
class PctProtocolFailureTests {
    /// A crafted replay schedule with an out-of-range actor slot is
    /// rejected at load: the loud failure path, never a hang and never a
    /// silent bogus replay (the regression anchor for the
    /// replay-validation finding — a crafted schedule must never reach
    /// the scheduler's decision stream).
    @TestCase
    func test_pct_replay_rejects_out_of_range_slot(): Unit {
        println("Testing PCT crafted-schedule rejection (out-of-range slot)...")
        let crafted = pctCraftedSchedule(seed: 4711u64, actorCount: 2, pcpBudget: 2,
            events: Array<TestPctEvent>(1, { _ =>
                TestPctEvent(kind: TestPctEventKind.Switch, from: 0, to: 5, step: 0) }))
        var rejected = false
        try {
            let result = scenario("pct_crafted_reject")
                .mode(PCT)
                .priorityChangePoints(2)
                .replaySchedule(crafted)
                .actor { => 0 }
                .actor { => 0 }
                .build()
                .run()
            println("Unexpectedly ran to completion: passed=${result.passed}")
        } catch (e: Exception) {
            rejected = e.message.contains("replay schedule load failed")
        }
        @Assert(rejected)
    }

    /// A framework-internal failure thrown under the coordinator lock is
    /// recorded and the iteration fails loudly at buildSchedule: the lock
    /// is released (later entries, the drain and the schedule build all
    /// complete) instead of every later dispatch stranding on a mutex
    /// nobody would ever release (the regression anchor for the
    /// lock-leak finding).
    @TestCase
    func test_pct_internal_failure_under_lock_fails_loudly(): Unit {
        println("Testing PCT injected protocol failure under the lock...")
        let injected = AtomicInt64(0)
        var failedLoudly = false
        try {
            let result = scenario("pct_injected_failure")
                .mode(PCT)
                .iterations(1)
                .pctSeed(20261116u64)
                .actor {
                    injected.store(1)
                    pctInjectProtocolFailure("injected framework failure (lock-leak regression)")
                    0
                }
                .actor { => 0 }
                .build()
                .run()
            println("Unexpectedly ran to completion: passed=${result.passed}")
        } catch (e: Exception) {
            failedLoudly = e.message.contains("PCT protocol dispatch failure")
        }
        @Assert(injected.load() == 1)
        @Assert(failedLoudly)
    }
}
