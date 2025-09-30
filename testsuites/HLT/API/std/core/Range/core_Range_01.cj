/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

import std.core.*

main() {
    var a = Range<Int64>(1, 3, 1, false, false, true)
    var b = Range<Int64>(1, 3, 1, false, false, false)
    var c = Range<Int64>(1, 5, 2, false, false, true)
    var d = Range<Int64>(5, 1, -1, false, false, true)

    for (i in a) {
        print(i)
    }
    println()
    for (i in b) {
        print(i)
    }
    println()
    for (i in c) {
        print(i)
    }
    println()
    for (i in d) {
        print(i)
    }
    println()
    return 0
}

/* SCAN
123
12
135
54321*/
