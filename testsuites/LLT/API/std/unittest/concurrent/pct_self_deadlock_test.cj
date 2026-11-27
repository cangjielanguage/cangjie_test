/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: helpers
// NOTE: this file MUST be compiled with --cj-pct — it pins the mirror's
// reentrancy parity with std: std.sync.Mutex is reentrant ("Support
// reentrant", mutex_cjnative.cj), so a same-thread second lock() must
// take the primitive again (silently — no park, no scheduling event)
// rather than self-deadlock or produce a spurious wait edge. This is
// also the resolution record for the audit's self-edge finding: with
// std's reentrant primitives (Mutex/Monitor/ReentrantMutex) and the
// loud read→write upgrade rejection (IllegalSynchronizationStateException),
// a one-actor A→A wait edge is structurally unreachable; the cycle
// detector nevertheless reports a self-edge as a one-actor cycle if one
// ever forms (see detectCycle's self-edge check).
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt p.%middle --experimental --cj-pct %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 1

import stdx.unittest.concurrent.*
import stdx.concurrent_test_util.*
import std.sync.*

@Test
class PctReentrantAcquireTests {
    /// The same-thread reentrant re-acquisition under PCT: the second
    /// lock() succeeds through the wrapper's reentrant probe — silently
    /// (no Wait event, no deadlock), exactly like std — and the actor
    /// completes.
    @TestCase
    func test_pct_reentrant_self_lock(): Unit {
        println("Testing PCT reentrant self-acquisition (std Mutex is reentrant)...")

        let m = Mutex()
        let value = AtomicInt64(0)

        let result = scenario("pct_reentrant_self_lock")
            .mode(PCT)
            .priorityChangePoints(0)
            .iterations(1)
            .pctSeed(20261119u64)
            .actor {
                m.lock()
                m.lock() // reentrant: takes the primitive again, no park
                value.store(Int64(42))
                m.unlock()
                m.unlock()
                0
            }
            .build()
            .run()

        @Assert(result.passed)
        @Assert(value.load() == Int64(42))
        @Assert(result.pctSchedule.isSome())
        let schedule = result.pctSchedule.getOrThrow()
        println("Schedule: ${schedule.report()}")

        // Reentrant acquisitions are event-invisible: no parks, no
        // deadlocks, nothing but the actor's own lifecycle events.
        var waits = 0
        var deadlocks = 0
        for (ev in pctEvents(schedule)) {
            match (ev.kind) {
                case Wait => waits++
                case Deadlock => deadlocks++
                case _ => ()
            }
        }
        @Assert(waits == 0)
        @Assert(deadlocks == 0)
    }
}
