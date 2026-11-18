/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: helpers
// NOTE: this file MUST be compiled with --cj-pct — it guards the unwind
// path of an actor's sleep under PCT: a deadlock abort while the actor is
// parked inside sleep() throws from the mirror's sleep (a plain Cangjie
// call reached through the imported-declaration reroute), so the exception
// must unwind through the actor's own try/finally/catch landing pads — the
// finally side effect is recorded, the abort exception is caught and
// rethrown by the actor's own handler, and the iteration then fails with
// the cycle as usual. (The compiler's hand-built dispatcher emissions —
// the SLEEP-intrinsic reroute and the entry marker call — keep the same
// invoke discipline; the intrinsic reroute is not reachable from user
// code, because the std.core sleep wrapper never inlines into
// flag-compiled modules.)
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt p.%middle --experimental --cj-pct %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 1

// ASSERT: scan sleeper_finally_ran=1 abort_caught=1

import stdx.unittest.concurrent.*
import stdx.concurrent_test_util.*
import std.sync.*

@Test
class PctSleepFinallyTests {
    /// A deadlock abort while an actor is parked inside sleep(): the abort
    /// wakes every parked actor without a grant and every coordinator entry
    /// throws from then on, so the exception surfaces from within the
    /// sleeper's sleep() call. The actor wraps that call in try/finally
    /// inside try/catch: the finally must run and the catch must see (and
    /// rethrow, failing the operation as before) the abort exception —
    /// both counted after run() returns.
    @TestCase
    func test_pct_sleep_finally_unwinds_through_handler(): Unit {
        println("Testing PCT sleep-in-try/finally unwind (deadlock abort)...")

        let m1 = Mutex()
        let m2 = Mutex()
        let mon = Monitor()
        let readyA = AtomicInt64(0)
        let readyB = AtomicInt64(0)
        let finallyRan = AtomicInt64(0)
        let abortCaught = AtomicInt64(0)

        let result = scenario("pct_sleep_finally")
            .mode(PCT)
            .priorityChangePoints(0)
            .iterations(1)
            .pctSeed(20261118u64)
            .actor("sleeper") {
                try {
                    try {
                        sleep(Duration.millisecond * 100)
                    } finally {
                        let _ = finallyRan.fetchAdd(1)
                    }
                } catch (e: Exception) {
                    // The abort exception reached the actor's own handler.
                    let _ = abortCaught.fetchAdd(1)
                    throw e
                }
                0
            }
            .actor {
                m1.lock()
                readyA.store(Int64(1))
                mon.lock()
                while (readyB.load() == Int64(0)) {
                    mon.wait() // park until the peer holds m2
                }
                mon.notify()
                mon.unlock()
                m2.lock() // the peer holds m2
                m2.unlock()
                m1.unlock()
                0
            }
            .actor {
                m2.lock()
                readyB.store(Int64(1))
                mon.lock()
                while (readyA.load() == Int64(0)) {
                    mon.wait() // park until the peer holds m1
                }
                mon.notify()
                mon.unlock()
                m1.lock() // the peer holds m1
                m1.unlock()
                m2.unlock()
                0
            }
            .build()
            .run()

        @Assert(!result.passed)
        @Assert(result.pctSchedule.isSome())
        let schedule = result.pctSchedule.getOrThrow()
        @Assert(pctIsDeadlocked(schedule))

        let reportText = result.report().toString()
        println(reportText)

        @Assert(finallyRan.load() == Int64(1))
        @Assert(abortCaught.load() == Int64(1))
        println("sleeper_finally_ran=${finallyRan.load()} abort_caught=${abortCaught.load()}")
    }
}
