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
// ASSERT: scan-begin Float16:y=1:throw exception
// ASSERT: scan-next Float32:y=1:throw exception
// ASSERT: scan-next Float64:y=1:throw exception
import std.math.*

main() {
    try {
        var m1 = logBase(Float16(9), Float16(1))
    } catch (e: IllegalArgumentException) {
        println("Float16:y=1:throw exception")
    }
    try {
        var m2 = logBase(Float32(9), Float32(1))
    } catch (e: IllegalArgumentException) {
        println("Float32:y=1:throw exception")
    }
    try {
        var m3 = logBase(Float64(9), Float64(1))
    } catch (e: IllegalArgumentException) {
        println("Float64:y=1:throw exception")
    }
    return 0
}
