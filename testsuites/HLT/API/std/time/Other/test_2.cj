/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
/* SCAN
106751d23h47m16s854ms775us807ns
106751d23h47m16s854ms775us
106751d23h47m16s854ms
106751d23h47m16s
106751d23h47m
106751d23h
-47m16s854ms775us807ns*/
import std.time.*
import std.math.*

main(): Int64 {
    println(Duration.nanosecond * Int64.Max)
    println(Duration.microsecond * (Int64.Max / 1000))
    println(Duration.millisecond * (Int64.Max / 1000 / 1000))
    println(Duration.second * (Int64.Max / 1000 / 1000 / 1000))
    println(Duration.minute * (Int64.Max / 1000 / 1000 / 1000 / 60))
    println(Duration.hour * (Int64.Max / 1000 / 1000 / 1000 / 60 / 60))
    println(Duration.hour * (Int64.Max / 1000 / 1000 / 1000 / 60 / 60) - Duration.nanosecond * Int64.Max)
    return 0
}
