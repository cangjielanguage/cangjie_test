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
// ASSERT: scan-begin Float16:x=-1:throw exception
// ASSERT: scan-next Float16:x<-1:throw exception
// ASSERT: scan-next Float16:x=1:throw exception
// ASSERT: scan-next Float16:x>1:throw exception
// ASSERT: scan-next Float16:x=inf16:throw exception
// ASSERT: scan-next Float16:x=-inf16:throw exception
import std.math.*

main() {
    try {
        var m1 = atanh(Float16(-1.0))
    } catch (e: IllegalArgumentException) {
        println("Float16:x=-1:throw exception")
    }
    try {
        var m2 = atanh(Float16(-1.1))
    } catch (e: IllegalArgumentException) {
        println("Float16:x<-1:throw exception")
    }
    try {
        var m3 = atanh(Float16(1.0))
    } catch (e: IllegalArgumentException) {
        println("Float16:x=1:throw exception")
    }
    try {
        var m4 = atanh(Float16(1.1))
    } catch (e: IllegalArgumentException) {
        println("Float16:x>1:throw exception")
    }
    try {
        var m5 = atanh(inf16)
    } catch (e: IllegalArgumentException) {
        println("Float16:x=inf16:throw exception")
    }
    try {
        var m6 = atanh(-inf16)
    } catch (e: IllegalArgumentException) {
        println("Float16:x=-inf16:throw exception")
    }
    return 0
}
