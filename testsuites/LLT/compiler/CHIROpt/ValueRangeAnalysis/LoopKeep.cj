// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// The loop is reanalysed until the pass gives the block up, so the exit test stays.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func loops(): Int64 {
    var a = 0
    while (a < 3) {
        a = a + 1
    }
    let x = a >= 3
    if (x) { return a }
    return 0
}

main() {
    return loops()
}

// ASSERT: regex LT\(.*// loc: "LoopKeep.cj"-15-12
// ASSERT: regex Branch\(.*// loc: "LoopKeep.cj"-15-5
// ASSERT: regex Add\(.*// loc: "LoopKeep.cj"-16-13
// ASSERT: regex GE\(.*// loc: "LoopKeep.cj"-18-13
