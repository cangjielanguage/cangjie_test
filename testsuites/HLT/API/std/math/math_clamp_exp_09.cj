/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args|compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
// ASSERT: scan-begin Float16:min is inf:throw exception
// ASSERT: scan-next Float32:min is inf:throw exception
// ASSERT: scan-next Float64:min is inf:throw exception
import std.math.*

main() {
    try {
        var m1 = clamp(Float16(-5.83), Float16(inf16), Float16(-3.45))
    } catch (e: IllegalArgumentException) {
        println("Float16:min is inf:throw exception")
    }
    try {
        var m2 = clamp(Float32(5.83), Float32(inf32), Float32(9.45))
    } catch (e: IllegalArgumentException) {
        println("Float32:min is inf:throw exception")
    }
    try {
        var m3 = clamp(Float64(-5.83), Float64(inf64), Float64(-3.45))
    } catch (e: IllegalArgumentException) {
        println("Float64:min is inf:throw exception")
    }
    return 0
}
