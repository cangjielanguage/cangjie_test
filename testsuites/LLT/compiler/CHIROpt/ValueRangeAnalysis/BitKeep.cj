// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Shifts, bitwise ops, exponent, negation and boolean not are not evaluated.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func bits(a: Int64): Int64 {
    let sh = 1 << 1
    let shgt = sh > 0
    let rs = 1 >> 1
    let band = a & 1
    let bor = a | 1
    let bxor = a ^ 1
    let pow = a ** 2
    let neg = -(a)
    let nt = !true
    var acc = sh + rs + band + bor + bxor + pow + neg
    if (shgt) { acc = acc + 1 }
    if (nt) { acc = acc + 1 }
    return acc
}

main() {
    return bits(1)
}

// ASSERT: regex LShift\(.*// loc: "BitKeep.cj"-14-14
// ASSERT: regex GT\(.*// loc: "BitKeep.cj"-15-16
// ASSERT: regex RShift\(.*// loc: "BitKeep.cj"-16-14
// ASSERT: regex BitAnd\(.*// loc: "BitKeep.cj"-17-16
// ASSERT: regex BitOr\(.*// loc: "BitKeep.cj"-18-15
// ASSERT: regex BitXor\(.*// loc: "BitKeep.cj"-19-16
// ASSERT: regex Exp\(.*// loc: "BitKeep.cj"-20-15
// ASSERT: regex Neg\(.*// loc: "BitKeep.cj"-21-15
// ASSERT: regex Not\(.*// loc: "BitKeep.cj"-22-14
