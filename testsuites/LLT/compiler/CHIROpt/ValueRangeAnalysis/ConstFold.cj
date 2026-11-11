// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Constant arithmetic and comparisons fold, and the operators are gone.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func consts(a: Int64): Int64 {
    let add = 1 + 2
    let sub = 5 - 3
    let mul = 4 * 3
    let div = 8 / 2
    let mod = 8 % 3
    let lt = 1 < 2
    let gt = 2 > 3
    let le = 1 <= 1
    let ge = 1 >= 2
    let eq = 1 == 1
    let ne = 1 != 1
    let be = true == false
    let bn = true != false
    let same = a == a
    let sgt = a > a
    var acc = add + sub + mul + div + mod
    if (lt) { acc = acc + 1 }
    if (gt) { acc = acc + 1 }
    if (le) { acc = acc + 1 }
    if (ge) { acc = acc + 1 }
    if (eq) { acc = acc + 1 }
    if (ne) { acc = acc + 1 }
    if (be) { acc = acc + 1 }
    if (bn) { acc = acc + 1 }
    if (same) { acc = acc + 1 }
    if (sgt) { acc = acc + 1 }
    return acc
}

main() {
    return consts(1)
}

// ASSERT: regex Int64 = Constant\(3i\) // loc: "ConstFold.cj"-14-15
// ASSERT: regex-not Add\(.*// loc: "ConstFold.cj"-14-15
// ASSERT: regex Int64 = Constant\(2i\) // loc: "ConstFold.cj"-15-15
// ASSERT: regex-not Sub\(.*// loc: "ConstFold.cj"-15-15
// ASSERT: regex Int64 = Constant\(12i\) // loc: "ConstFold.cj"-16-15
// ASSERT: regex-not Mul\(.*// loc: "ConstFold.cj"-16-15
// ASSERT: regex Int64 = Constant\(4i\) // loc: "ConstFold.cj"-17-15
// ASSERT: regex-not Div\(.*// loc: "ConstFold.cj"-17-15
// ASSERT: regex Int64 = Constant\(2i\) // loc: "ConstFold.cj"-18-15
// ASSERT: regex-not Mod\(.*// loc: "ConstFold.cj"-18-15
// ASSERT: regex Bool = Constant\(true\) // loc: "ConstFold.cj"-19-14
// ASSERT: regex-not LT\(.*// loc: "ConstFold.cj"-19-14
// ASSERT: regex Bool = Constant\(false\) // loc: "ConstFold.cj"-20-14
// ASSERT: regex-not GT\(.*// loc: "ConstFold.cj"-20-14
// ASSERT: regex Bool = Constant\(true\) // loc: "ConstFold.cj"-21-14
// ASSERT: regex-not LE\(.*// loc: "ConstFold.cj"-21-14
// ASSERT: regex Bool = Constant\(false\) // loc: "ConstFold.cj"-22-14
// ASSERT: regex-not GE\(.*// loc: "ConstFold.cj"-22-14
// ASSERT: regex Bool = Constant\(true\) // loc: "ConstFold.cj"-23-14
// ASSERT: regex-not Equal\(.*// loc: "ConstFold.cj"-23-14
// ASSERT: regex Bool = Constant\(false\) // loc: "ConstFold.cj"-24-14
// ASSERT: regex-not NotEqual\(.*// loc: "ConstFold.cj"-24-14
// ASSERT: regex Bool = Constant\(false\) // loc: "ConstFold.cj"-25-14
// ASSERT: regex-not Equal\(.*// loc: "ConstFold.cj"-25-14
// ASSERT: regex-not NotEqual\(.*// loc: "ConstFold.cj"-26-14
// ASSERT: regex Bool = Constant\(true\) // loc: "ConstFold.cj"-27-16
// ASSERT: regex-not Equal\(.*// loc: "ConstFold.cj"-27-16
// ASSERT: regex Bool = Constant\(false\) // loc: "ConstFold.cj"-28-15
// ASSERT: regex-not GT\(.*// loc: "ConstFold.cj"-28-15
