/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: helpers
// NOTE: this file MUST be compiled with --cj-pct — it verifies the
// virtual clock's arm-time timer purge: every timed condition wait arms
// a virtual timer, and a wait ended by a notify (not by the deadline)
// leaves its entry stale. The only other purge (earliestValid) runs
// solely on the quiescence/strand path, which a live wait/notify
// ping-pong never reaches — so without the arm-time purge the armed
// list grows by one stale entry per cycle for the whole window. The
// purge keeps it bounded by the waiter count (an actor parks on one
// wait at a time; a barging re-wait never re-arms, so the arming
// actor's earlier entry is stale by construction when it arms again).
// The second case pins the purge's safety: a LIVE timer (no notify at
// all) must still fire at quiescence.
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt p.%middle --experimental --cj-pct %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 2

import stdx.unittest.concurrent.*
import stdx.concurrent_test_util.*
import std.sync.*

@Test
class PctTimerPurgeTests {
    /// A wait/notify hot loop with finite timeouts: 300 cycles each arm
    /// a timer that the notify then strands. The armed list's high-water
    /// mark (carried in the recorded schedule) must stay bounded by the
    /// waiter count instead of accumulating one stale entry per cycle.
    @TestCase
    func test_pct_timer_purge_hot_loop_bounded(): Unit {
        println("Testing PCT timer purge (wait/notify hot loop)...")

        let mon = Monitor()
        let served = AtomicInt64(0)

        let result = scenario("pct_timer_purge")
            .mode(PCT)
            .priorityChangePoints(0)
            .iterations(1)
            .pctSeed(20261120u64)
            .actor("waiter") {
                mon.lock()
                while (served.load() < Int64(300)) {
                    // A finite timeout arms a virtual timer every round.
                    mon.wait(timeout: Duration.millisecond)
                }
                mon.unlock()
                0
            }
            .actor("notifier") {
                while (served.load() < Int64(300)) {
                    mon.lock()
                    served.fetchAdd(1)
                    mon.notify()
                    mon.unlock()
                }
                0
            }
            .build()
            .run()

        @Assert(result.passed)
        @Assert(served.load() == Int64(300))
        @Assert(result.pctSchedule.isSome())
        let schedule = result.pctSchedule.getOrThrow()
        println("Schedule: ${schedule.report()}")

        // Only the waiter arms timers, and each arm drops that actor's
        // stale entry first: the list holds at most the single armed
        // waiter (2 allows slack without weakening the regression —
        // without the purge the high water would reach ~300).
        let highWater = pctTimersHighWater(schedule)
        println("Armed timers high water: ${highWater}")
        @Assert(highWater <= Int64(2))
    }

    /// Purge safety: a single timed wait with no notify at all must
    /// still fire at quiescence (exactly one Timer event, the waiter
    /// revived by the deadline — `wait` returns false), proving the
    /// arm-time purge never drops the arming actor's LIVE entry.
    @TestCase
    func test_pct_timer_purge_live_timer_fires(): Unit {
        println("Testing PCT timer purge safety (live timer fires)...")

        let mon = Monitor()
        let wokeByDeadline = AtomicInt64(0)

        let result = scenario("pct_timer_live")
            .mode(PCT)
            .priorityChangePoints(0)
            .iterations(1)
            .pctSeed(20261120u64)
            .actor {
                mon.lock()
                let notified = mon.wait(timeout: Duration.millisecond)
                if (!notified) {
                    wokeByDeadline.store(Int64(1))
                }
                mon.unlock()
                0
            }
            .build()
            .run()

        @Assert(result.passed)
        @Assert(wokeByDeadline.load() == Int64(1))
        @Assert(result.pctSchedule.isSome())
        var timers = 0
        for (ev in pctEvents(result.pctSchedule.getOrThrow())) {
            match (ev.kind) {
                case Timer => timers++
                case _ => ()
            }
        }
        @Assert(timers == 1)
        let highWater = pctTimersHighWater(result.pctSchedule.getOrThrow())
        println("Live timer fired (Timer events: ${timers}, high water: ${highWater})")
        @Assert(highWater == Int64(1))
    }
}
