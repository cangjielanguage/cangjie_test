// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// An unknown condition stays. Every value of x is > 0 and none of them is 3.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func ranges(c: Bool): Int64 {
    var x = 2
    if (c) {
        x = 4
    } else {
        x = 6
    }
    let xp = x + 1
    let xgt = x > 0
    let xeq = x == 3
    var acc = xp
    if (xgt) { acc = acc + 1 }
    if (xeq) { acc = acc + 1 }
    return acc
}

main() {
    return ranges(true)
}

// ASSERT: regex Branch\(.*// loc: "RangeJoin.cj"-15-5
// ASSERT: regex Add\(.*// loc: "RangeJoin.cj"-20-14
// ASSERT: regex Bool = Constant\(true\) // loc: "RangeJoin.cj"-21-15
// ASSERT: regex-not GT\(.*// loc: "RangeJoin.cj"-21-15
// ASSERT: regex Bool = Constant\(false\) // loc: "RangeJoin.cj"-22-15
// ASSERT: regex-not Equal\(.*// loc: "RangeJoin.cj"-22-15
