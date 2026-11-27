/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: helpers
// NOTE: this file MUST be compiled with --cj-pct — it verifies the
// PCT path's pre-window failure semantics: a reset-block (or state
// factory) exception in a later iteration becomes THAT iteration's
// failed result — visible in the report, every completed iteration
// before it retained — instead of unwinding run() itself and discarding
// them (the asymmetry with the stress path's synthesized failed
// iterations; the Error family is bracketed the same way). The window
// machinery itself deliberately stays fail-fast: an activation failure
// (an uninstrumented binary) still throws out of run(), pinned by
// pct_uninstrumented_test. NoValidation keeps the reset invocation
// count deterministic (the auto-spec validator would otherwise re-invoke
// the reset block during iteration 0's sequential re-execution).
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt p.%middle --experimental --cj-pct %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 1

// ASSERT: scan pct reset boom
// ASSERT: scan Iterations: 2

import stdx.unittest.concurrent.*
import stdx.concurrent_test_util.*
import std.sync.AtomicInt64

@Test
class PctResetFailureTests {
    /// Iteration 0 runs its window normally; iteration 1's reset block
    /// throws before any window exists. The throw must surface as
    /// iteration 1's failed result (run() completes, the report names
    /// the exception and retains both iterations' results) — not as an
    /// exception out of run() with every completed iteration lost.
    @TestCase
    func test_pct_reset_failure_becomes_failed_iteration(): Unit {
        println("Testing PCT reset failure (failed iteration, run() completes)...")

        let resets = AtomicInt64(0)
        let opRan = AtomicInt64(0)

        // No pctSeed here: a fixed seed forces a one-iteration scenario,
        // and this test needs the second iteration to run.
        let result = scenario("pct_reset_failure")
            .mode(PCT)
            .priorityChangePoints(0)
            .iterations(2)
            .consistencyModel(NoValidation)
            .reset {
                // Iteration 0's loop invocation: clean (NoValidation
                // means the validator never re-invokes this block).
                // Iteration 1's loop invocation: the tested failure.
                if (resets.fetchAdd(1) >= Int64(1)) {
                    throw IllegalArgumentException("pct reset boom")
                }
            }
            .actor {
                opRan.fetchAdd(1)
                0
            }
            .build()
            .run()

        @Assert(!result.passed)
        // Only iteration 0's actor ran; iteration 1 failed pre-window.
        @Assert(opRan.load() == Int64(1))
        let reportText = result.report().toString()
        println(reportText)
        @Assert(reportText.contains("pct reset boom"))
        // Both iteration results retained — the regression this pins:
        // pre-fix, run() itself threw and no result object existed.
        @Assert(reportText.contains("Iterations: 2"))
    }
}
