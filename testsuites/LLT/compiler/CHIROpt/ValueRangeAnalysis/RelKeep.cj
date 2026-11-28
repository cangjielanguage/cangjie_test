// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (a - 1) + 1 == a is not proved. && does not carry a > 0 into the body. Inequality is not recorded on the false edge of ==.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func rel(a: Int64, b: Int64): Int64 {
    let id = (a - 1) + 1 == a
    var acc = 0
    if (id) { acc = acc + 1 }
    if (a > 0 && b > 0) {
        let both = a > 0
        if (both) { acc = acc + 1 }
    }
    if (a == b) {
        acc = acc + 1
    } else {
        let ne = a != b
        if (ne) { acc = acc + 1 }
    }
    return acc
}

main() {
    return rel(1, 2)
}

// ASSERT: regex Equal\(.*// loc: "RelKeep.cj"-14-14
// ASSERT: regex GT\(.*// loc: "RelKeep.cj"-18-20
// ASSERT: regex Equal\(.*// loc: "RelKeep.cj"-21-9
// ASSERT: regex NotEqual\(.*// loc: "RelKeep.cj"-24-18
