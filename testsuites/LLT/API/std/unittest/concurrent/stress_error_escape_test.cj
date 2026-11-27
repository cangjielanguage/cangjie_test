/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: helpers
// NOTE: verifies the drain guards against the Error family on both
// iteration-dispatch paths. Parallel: a StackOverflowError raised on an
// ITERATION thread (here the verify block of a parallel iteration; the
// same bracket covers the reset/state factory, the verify, and the
// consistency validator's recursive DFS) is not an Exception, so it
// escapes every exception-level guard. The dispatch spawn's last-resort
// bracket must convert it into a failed iteration result and still
// enqueue it: without the Error clause the spawn would die before
// enqueueing and the result drain would block forever (the run hangs);
// with it the run completes and reports the aborted iteration.
// Sequential: runIteration's own bracket gets the same Error clause, so
// a reset-block Error on the caller thread becomes that iteration's
// failed result instead of unwinding run() itself. Iteration 0 (the
// sequential calibration iteration) stays clean via an invocation
// counter in both cases, so the failure lands in a later iteration —
// the exact shape of each bracket. (An Error thrown by an operation
// body instead dies at the actor-thread level before any framework
// catch — a loud per-thread failure the runtime reports itself.)
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt p.%middle %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 2

// ASSERT: scan iteration aborted by an Error

import stdx.unittest.concurrent.*
import std.sync.AtomicInt64

// Non-tail recursion (the accumulator forces a stack frame per call):
// guaranteed stack growth, no tail-call elimination.
func deep(n: Int64): Int64 {
    let r = deep(n + 1)
    r + n
}

@Test
class StressErrorEscapeTests {
    /// A runaway recursion in a parallel iteration's verify block raises
    /// StackOverflowError — an Error, not an Exception. The drain
    /// bracket must catch it, synthesize the failed iteration, and
    /// enqueue it, so the run completes with an honest failure instead
    /// of hanging the result queue.
    @TestCase
    func test_stress_error_escape_drains(): Unit {
        println("Testing Stress drain on an escaping Error (StackOverflowError)...")

        let verifies = AtomicInt64(0)
        let result = scenario("stress_error_escape")
            .actorWithOps([
                operation<Int64>("noop_a") { => 0 }
            ])
            .actorWithOps([
                operation<Int64>("noop_b") { => 0 }
            ])
            .verify {
                // Iteration 0 (sequential calibration) verifies cleanly;
                // the parallel iterations overflow their iteration thread.
                if (verifies.fetchAdd(1) > Int64(0)) {
                    deep(0)
                }
                true
            }
            .iterations(3)
            .parallelIterations(true)
            .build()
            .run()

        @Assert(!result.passed)
        let reportText = result.report().toString()
        println(reportText)
        @Assert(reportText.contains("iteration aborted by an Error"))
        @Assert(reportText.contains("StackOverflowError"))
    }

    /// The sequential path's bracket: a runaway recursion in a LATER
    /// iteration's reset block raises StackOverflowError on the caller
    /// thread (capture-based scenarios dispatch sequentially by
    /// default). runIteration's Error clause must synthesize the failed
    /// iteration — run() completes with an honest failure and every
    /// completed iteration retained — instead of unwinding run() itself
    /// with a raw process-level error report.
    @TestCase
    func test_stress_error_escape_sequential_reset(): Unit {
        println("Testing sequential Stress bracket on an escaping Error (reset)...")

        let resets = AtomicInt64(0)
        let opRan = AtomicInt64(0)

        let result = scenario("stress_error_escape_seq")
            .consistencyModel(NoValidation)
            .reset {
                // Iteration 0 (the sequential calibration iteration)
                // resets cleanly; iteration 1 overflows the caller
                // thread's stack. NoValidation keeps this block's
                // invocation count deterministic (the auto-spec
                // validator would otherwise re-invoke it during
                // iteration 0's sequential re-execution).
                if (resets.fetchAdd(1) >= Int64(1)) {
                    deep(0)
                }
            }
            .actorWithOps([
                operation<Int64>("noop") {
                    opRan.fetchAdd(1)
                    0
                }
            ])
            .iterations(2)
            .build()
            .run()

        @Assert(!result.passed)
        // Only iteration 0's actor ran; iteration 1 failed pre-actors.
        @Assert(opRan.load() == Int64(1))
        let reportText = result.report().toString()
        println(reportText)
        @Assert(reportText.contains("iteration aborted by an Error"))
        @Assert(reportText.contains("StackOverflowError"))
        @Assert(reportText.contains("Iterations: 2"))
    }
}
