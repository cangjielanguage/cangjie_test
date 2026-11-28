// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Initial loop values must not produce permanent divide/modulo/overflow errors.
// EXEC: %compiler %enableO2 %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %compiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %f -o %output.range
// EXEC: %run %run_opt %output.range %run_args
// EXEC: %compiler -Os %f -o %output.Os
// EXEC: %run %run_opt %output.Os %run_args
// EXEC: %compiler -Oz %f -o %output.Oz
// EXEC: %run %run_opt %output.Oz %run_args

func average(): Int64 {
    let values = [6, 9, 12]
    var sum: Int64 = 0
    var count: Int64 = 0
    for (value in values) {
        sum += value
        count += 1
    }
    return sum / count
}

func remainders(): Int64 {
    var signed: Int64 = 0
    var unsigned: UInt64 = 0
    for (value in [1, 2, 3]) {
        signed += value
        unsigned += UInt64(value)
    }
    if (UInt64(18) / unsigned != 3 || UInt64(19) % unsigned != 1) { return 1 }
    if (18 / signed != 3 || 19 % signed != 1) { return 2 }
    return 0
}

func afterLoop(): Int64 {
    var signed: Int8 = 100
    var unsigned: UInt8 = 200
    for (value in [1, 2, 3]) {
        signed = Int8(value)
        unsigned = UInt8(value)
    }
    // The initial values would overflow; the values after the loop are both 3.
    if (signed + signed != 6 || unsigned + unsigned != 6) { return 1 }
    return 0
}

main(): Int64 {
    if (average() != 9) { return 1 }
    if (remainders() != 0) { return 2 }
    if (afterLoop() != 0) { return 3 }
    return 0
}
