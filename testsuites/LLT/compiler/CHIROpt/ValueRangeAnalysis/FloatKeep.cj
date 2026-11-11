// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Floats are not tracked.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func floats(f: Float64): Int64 {
    let fadd = 1.0 + 2.0
    let fgt = f > 1.0
    var acc = Int64(fadd)
    if (fgt) { acc = acc + 1 }
    if (fadd > 0.0) { acc = acc + 1 }
    return acc
}

main() {
    return floats(1.0)
}

// ASSERT: regex Float64 = Add\(.*// loc: "FloatKeep.cj"-14-16
// ASSERT: regex GT\(.*// loc: "FloatKeep.cj"-15-15
// ASSERT: regex GT\(.*// loc: "FloatKeep.cj"-18-9
