// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Joining true and false is not a single bool.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func boolJoin(c: Bool): Int64 {
    var diff = true
    if (c) {
        diff = true
    } else {
        diff = false
    }
    let x = diff == true
    if (x) { return 1 }
    return 0
}

main() {
    return boolJoin(true)
}

// ASSERT: regex Equal\(.*// loc: "BoolDiff.cj"-20-13
