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
    var a = "abc"
    for (i in a.runes()) {
        print(i)
    }
    println()
    var a1 = String([r'a', r'\u{77}', r'c'])
    for (i in a1.runes()) {
        print(i)
    }
    println()
    var a2 = String([r' ', r'.', r'\\'])
    for (i in a2.runes()) {
        print(i)
    }
    println()
    var a3 = ""
    for (i in a3.runes()) {
        print(i)
    }

    println()
    for (i in "a3".runes()) {
        print(i)
    }
    0
}

/* SCAN
abc
awc
 .\

a3*/
