// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Joining two identical bools is that bool.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func bools(c: Bool): Int64 {
    var same = true
    if (c) {
        same = true
    } else {
        same = true
    }
    let y = same == true
    var acc = 0
    if (y) { acc = acc + 1 }
    return acc
}

main() {
    return bools(true)
}

// ASSERT: regex Bool = Constant\(true\) // loc: "BoolSame.cj"-20-13
// ASSERT: regex-not Equal\(.*// loc: "BoolSame.cj"-20-13
