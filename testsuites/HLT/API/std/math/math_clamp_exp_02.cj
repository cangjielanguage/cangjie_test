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
// ASSERT: scan-begin Floaat16:0>min>max and min>v>max
// ASSERT: scan-next Floaat16:0>min>max and v=nan
// ASSERT: scan-next Floaat16:0>min>max and v=inf
// ASSERT: scan-next Floaat32:0>min>max and min>v>max
// ASSERT: scan-next Floaat32:0>min>max and v=nan
// ASSERT: scan-next Floaat32:0>min>max and v=inf
// ASSERT: scan-next Floaat64:0>min>max and min>v>max
// ASSERT: scan-next Floaat64:0>min>max and v=nan
// ASSERT: scan-next Floaat64:0>min>max and v=inf
import std.math.*

main() {
    try {
        var m1 = clamp(Float16(-5.83), Float16(-3.98), Float16(-9.45))
    } catch (e: IllegalArgumentException) {
        println("Floaat16:0>min>max and min>v>max")
    }
    try {
        var m2 = clamp(Float16(-nan16), Float16(-3.98), Float16(-9.45))
    } catch (e: IllegalArgumentException) {
        println("Floaat16:0>min>max and v=nan")
    }
    try {
        var m3 = clamp(Float16(-inf16), Float16(-3.98), Float16(-9.45))
    } catch (e: IllegalArgumentException) {
        println("Floaat16:0>min>max and v=inf")
    }
    try {
        var m4 = clamp(Float32(-5.83), Float32(-3.98), Float32(-9.45))
    } catch (e: IllegalArgumentException) {
        println("Floaat32:0>min>max and min>v>max")
    }
    try {
        var m5 = clamp(Float32(-nan32), Float32(-3.98), Float32(-9.45))
    } catch (e: IllegalArgumentException) {
        println("Floaat32:0>min>max and v=nan")
    }
    try {
        var m6 = clamp(Float32(-inf32), Float32(-3.98), Float32(-9.45))
    } catch (e: IllegalArgumentException) {
        println("Floaat32:0>min>max and v=inf")
    }
    try {
        var m7 = clamp(Float64(-5.83), Float64(-3.98), Float64(-9.45))
    } catch (e: IllegalArgumentException) {
        println("Floaat64:0>min>max and min>v>max")
    }
    try {
        var m8 = clamp(Float64(-nan64), Float64(-3.98), Float64(-9.45))
    } catch (e: IllegalArgumentException) {
        println("Floaat64:0>min>max and v=nan")
    }
    try {
        var m9 = clamp(Float64(-inf64), Float64(-3.98), Float64(-9.45))
    } catch (e: IllegalArgumentException) {
        println("Floaat64:0>min>max and v=inf")
    }
    return 0
}
