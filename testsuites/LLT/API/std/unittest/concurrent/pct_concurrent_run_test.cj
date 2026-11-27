/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: helpers
// NOTE: this file MUST be compiled with --cj-pct — it pins the
// single-active-window contract for CONCURRENT scenario runs: while one
// PCT window is in flight (its actor parked on a mutex held by an
// unmanaged external thread — the recoverable strand, revived by the
// external release), a second scenario's run() must fail loudly at
// activation instead of silently installing over the active window. An
// overwritten window's dispatches are tid-filtered into absorption: its
// actors run on real primitives, its schedule comes out near-empty,
// and it can PASS without having tested anything (the S-01 audit
// finding; the install is serialized on the iteration guard so the
// check-then-act gap between activate() and the install cannot let a
// racing second run through either). After the active window completes,
// the next run succeeds — the guard is released with the window, not
// leaked.
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt p.%middle --experimental --cj-pct %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 1

import stdx.unittest.concurrent.*
import stdx.concurrent_test_util.*
import std.sync.*

@Test
class PctConcurrentRunTests {
    /// The in-flight window pins the active-iteration reference; the
    /// second run must fail loudly ("still active"), the in-flight
    /// window must complete unaffected (its dispatches NOT absorbed —
    /// the strand's Deadlock plus the external release's Resume are
    /// mediated-decision events an absorbed window cannot record), and
    /// the guard must be released afterwards (a third run succeeds).
    /// The parking shape is the external-holder pattern: the main
    /// thread takes the mutex BEFORE the window exists (an unmanaged
    /// hold), the actor's mediated acquire strands on the untracked
    /// holder, and the main thread's unlock is the stranded-token
    /// grant that revives it.
    @TestCase
    func test_pct_second_run_fails_loudly_while_window_active(): Unit {
        println("Testing PCT concurrent run exclusion...")

        let mx = Mutex()
        let entered = AtomicInt64(0)
        let actorDone = AtomicInt64(0)
        let deadlockEvents = AtomicInt64(0)
        let resumeEvents = AtomicInt64(0)

        // Main is the external holder: an unmanaged acquire before any
        // window exists, so the actor's mediated acquire below strands
        // recoverably (no wait-for cycle — the holder is untracked).
        mx.lock()

        // The in-flight window: the actor parks on the externally held
        // mutex, so the window stays open across the second run's
        // activation attempt.
        let inflight = spawn {
            let result = scenario("pct_concurrent_a")
                .mode(PCT)
                .priorityChangePoints(0)
                .iterations(1)
                .pctSeed(20261120u64)
                .actor {
                    entered.store(Int64(1))
                    mx.lock()
                    actorDone.store(Int64(1))
                    mx.unlock()
                    0
                }
                .build()
                .run()
            var deadlocks = 0
            var resumes = 0
            if (let Some(s) <- result.pctSchedule) {
                for (ev in pctEvents(s)) {
                    match (ev.kind) {
                        case Deadlock => deadlocks++
                        case Resume => resumes++
                        case _ => ()
                    }
                }
            }
            deadlockEvents.store(Int64(deadlocks))
            resumeEvents.store(Int64(resumes))
            result.passed
        }

        // Wait until the actor is inside its operation: the window is
        // installed before the actor spawn, so `entered` implies the
        // active-iteration reference is set.
        while (entered.load() == Int64(0)) {
            sleep(Duration.millisecond)
        }

        // The second run, while the first window is active: it must fail
        // loudly at activation — never silently install over the active
        // window.
        var secondThrew = false
        var message = ""
        try {
            let _ = scenario("pct_concurrent_b")
                .mode(PCT)
                .priorityChangePoints(0)
                .iterations(1)
                .pctSeed(4711u64)
                .actor { => 0 }
                .build()
                .run()
        } catch (e: Exception) {
            secondThrew = true
            message = e.message
        }
        @Assert(secondThrew)
        println("Second run failed loudly: ${message}")
        @Assert(message.contains("still active"))

        // Release the external hold: the unmanaged unlock is the
        // stranded-token grant — the in-flight window completes normally
        // and its dispatches were real mediated decisions (the strand's
        // Deadlock and the release's Resume; an absorbed window records
        // neither).
        mx.unlock()
        @Assert(inflight.get())
        @Assert(actorDone.load() == Int64(1))
        @Assert(deadlockEvents.load() == Int64(1))
        @Assert(resumeEvents.load() == Int64(1))

        // The guard is released with the window: a subsequent run
        // succeeds (the exclusion is per active window, not a leak).
        let after = scenario("pct_concurrent_c")
            .mode(PCT)
            .priorityChangePoints(0)
            .iterations(1)
            .pctSeed(4712u64)
            .actor { => 0 }
            .build()
            .run()
        @Assert(after.passed)
        println("Post-window run passed; in-flight window: deadlocks=${deadlockEvents.load()} resumes=${resumeEvents.load()}")
    }
}
