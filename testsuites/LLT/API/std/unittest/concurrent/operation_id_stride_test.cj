/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: helpers
// NOTE: verifies the operationId encoding's actor-band stride: the
// historical actorId*1000+index encoding let a single actor's operation
// 1000 masquerade as actor 1's operation 0, so the consistency
// validator decoded a nonexistent actor and returned a guaranteed false
// "not consistent" (a multi-actor history silently merged operations
// instead — a false pass). The 2^32-wide bands keep every id unique and
// decodable for any reachable operation count.
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt -p helpers %compile_lib_opt --output p.%middle
// EXEC: %compiler %import-stdx-unittest-concurrent %cmp_opt p.%middle %f -o %output %cmp_utest_opt %enableO2
// RUN-EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_args %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 1

import stdx.unittest.concurrent.*
import stdx.concurrent_test_util.*

/** Per-iteration state of the stride test: a plain counted box. */
class OpIdCounter {
    var v: Int64 = 0
}

@Test
class OperationIdStrideTests {
    /// One actor, 1050 operations (past the historical 1000 stride),
    /// SequentialConsistency: every operation's id must stay inside
    /// actor 0's band and decode back to the recording actor, so the
    /// observed history validates as consistent — the pre-stride
    /// encoding failed this exact shape with a bogus actor-1 lookup.
    @TestCase
    func test_operation_id_stride_beyond_1000_ops(): Unit {
        println("Testing operation id stride (single actor, 1050 ops)...")

        let ops = Array<Operation<OpIdCounter>>(1050, { i: Int64 =>
            operation<Int64, OpIdCounter>("op_${i}") { s =>
                s.v += 1
                s.v
            }
        })

        let result = scenario("op_id_stride")
            .withState { => OpIdCounter() }
            .consistencyModel(SequentialConsistency)
            .actorWithOps(ops)
            .iterations(1)
            .build()
            .run()

        @Assert(result.passed)
        println("Result: ${result.report()}")
    }
}
