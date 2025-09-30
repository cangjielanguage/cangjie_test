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
// ASSERT: scan-begin Float16:min,v is nan:throw exception
// ASSERT: scan-next Float16:min,max is nan:throw exception
// ASSERT: scan-next Float16:max,v is nan:throw exception
// ASSERT: scan-next Float32:min,v is nan:throw exception
// ASSERT: scan-next Float32:min,max is nan:throw exception
// ASSERT: scan-next Float32:max,v is nan:throw exception
// ASSERT: scan-next Float64:min,v is nan:throw exception
// ASSERT: scan-next Float64:min,max is nan:throw exception
// ASSERT: scan-next Float64:max,v is nan:throw exception
import std.math.*

main() {
    try {
        var m1 = clamp(Float16(nan16), Float16(nan16), Float16(-3.45))
    } catch (e: IllegalArgumentException) {
        println("Float16:min,v is nan:throw exception")
    }
    try {
        var m2 = clamp(Float16(5.83), Float16(nan16), Float16(nan16))
    } catch (e: IllegalArgumentException) {
        println("Float16:min,max is nan:throw exception")
    }
    try {
        var m3 = clamp(Float16(nan16), Float16(-3.45), Float16(nan16))
    } catch (e: IllegalArgumentException) {
        println("Float16:max,v is nan:throw exception")
    }
    try {
        var m4 = clamp(Float32(nan32), Float32(nan32), Float32(-3.45))
    } catch (e: IllegalArgumentException) {
        println("Float32:min,v is nan:throw exception")
    }
    try {
        var m5 = clamp(Float32(5.83), Float32(nan32), Float32(nan32))
    } catch (e: IllegalArgumentException) {
        println("Float32:min,max is nan:throw exception")
    }
    try {
        var m6 = clamp(Float32(nan32), Float32(-3.45), Float32(nan32))
    } catch (e: IllegalArgumentException) {
        println("Float32:max,v is nan:throw exception")
    }
    try {
        var m7 = clamp(Float64(nan64), Float64(nan64), Float64(-3.45))
    } catch (e: IllegalArgumentException) {
        println("Float64:min,v is nan:throw exception")
    }
    try {
        var m8 = clamp(Float64(5.83), Float64(nan64), Float64(nan64))
    } catch (e: IllegalArgumentException) {
        println("Float64:min,max is nan:throw exception")
    }
    try {
        var m9 = clamp(Float64(nan64), Float64(-3.45), Float64(nan64))
    } catch (e: IllegalArgumentException) {
        println("Float64:max,v is nan:throw exception")
    }
    return 0
}
