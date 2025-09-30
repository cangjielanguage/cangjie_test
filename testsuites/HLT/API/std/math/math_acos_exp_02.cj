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
// RUN-EXEC-PIPE: %run %run_opt %output %run_args |compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
// ASSERT: scan-begin Float32:x<-1:throw exception
// ASSERT: scan-next Float32:x>1:throw exception
// ASSERT: scan-next Float32:x=inf32:throw exception
// ASSERT: scan-next Float32:x=-inf32:throw exception
import std.math.*

main() {
    var m: Float32 = -1.1
    try {
        var a1 = acos(m)
    } catch (e: IllegalArgumentException) {
        println("Float32:x<-1:throw exception")
    }
    var n: Float32 = 1.1
    try {
        var a2 = acos(n)
    } catch (e: IllegalArgumentException) {
        println("Float32:x>1:throw exception")
    }
    try {
        var a3 = acos(inf32)
    } catch (e: IllegalArgumentException) {
        println("Float32:x=inf32:throw exception")
    }
    try {
        var a4 = acos(-inf32)
    } catch (e: IllegalArgumentException) {
        println("Float32:x=-inf32:throw exception")
    }
    return 0
}
