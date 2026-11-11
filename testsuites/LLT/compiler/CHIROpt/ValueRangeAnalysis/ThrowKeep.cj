// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An Int8 add and a narrowing cast of unknown inputs stay.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func mayThrow(b: Int8, c: Int8, a: Int64): Int64 {
    let y = b + c
    let x = Int8(a)
    return Int64(y) + Int64(x)
}

main() {
    return mayThrow(2, 3, 4)
}

// ASSERT: regex Int8 = Add\(.*// loc: "ThrowKeep.cj"-14-13
// ASSERT: regex Int8 = NumericCast\(.*// loc: "ThrowKeep.cj"-15-13
