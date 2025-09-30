/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.math.*

main() {
    var count = 0
    try {
        var a = abs(Int8(-128))
    } catch (e: Exception) {
        count++
    }
    try {
        var a = abs(Int16(-32768))
    } catch (e: Exception) {
        count++
    }
    try {
        var a = abs(Int32(-2147483648))
    } catch (e: Exception) {
        count++
    }
    try {
        var a = abs(Int64(-9223372036854775808))
    } catch (e: Exception) {
        count++
    }
    if (count != 4) {
        return 1
    }
    return 0
}
