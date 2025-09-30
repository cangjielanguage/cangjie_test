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
// ASSERT: scan-begin x*y<-9223372036854775808:throw exception
// ASSERT: scan-next x*y>9223372036854775807:throw exception
import std.math.*

main() {
    try {
        var m1 = lcm(Int64(-4611686018427387905), Int64(2))
    } catch (e: IllegalArgumentException) {
        println("x*y<-9223372036854775808:throw exception")
    }
    try {
        var m2 = lcm(Int64(4611686018427387907), Int64(2))
    } catch (e: IllegalArgumentException) {
        println("x*y>9223372036854775807:throw exception")
    }
    return 0
}
