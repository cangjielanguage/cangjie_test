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
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-begin Float64:x<0且是整数:throw exception
// ASSERT: scan-next Float64:x<0且是小数:throw exception
import std.math.*

main() {
    try {
        var m1 = sqrt(Float64(-4.0))
    } catch (e: IllegalArgumentException) {
        println("Float64:x<0且是整数:throw exception")
    }
    try {
        var m1 = sqrt(Float64(-0.25))
    } catch (e: IllegalArgumentException) {
        println("Float64:x<0且是小数:throw exception")
    }
    return 0
}
