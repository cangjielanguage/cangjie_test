// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Branch predicates do not refine parameter ranges. Repeated comparisons must stay in CHIR.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func edges(a: Int64, b: Int64): Int64 {
    var acc = 0
    if (a > b) {
        let hold = a > b
        let notlt = a < b
        if (hold) { acc = acc + 1 }
        if (notlt) { acc = acc + 1 }
    } else {
        let le = a <= b
        if (le) { acc = acc + 1 }
    }
    if (a == b) {
        let eq = a == b
        let ne = a != b
        if (eq) { acc = acc + 1 }
        if (ne) { acc = acc + 1 }
    }
    if (a >= 0) {
        if (b >= 0) {
            if (a > b) {
                let cast = UInt64(a)
                if (cast == 0) { acc = acc + 1 }
                acc = acc + Int64(cast)
            }
        }
    }
    return acc
}

main() {
    return edges(1, 2)
}

// ASSERT: regex GT\(.*// loc: "EdgeRefine.cj"-15-9
// ASSERT: regex Branch\(.*// loc: "EdgeRefine.cj"-15-5
// ASSERT: regex GT\(.*// loc: "EdgeRefine.cj"-16-20
// ASSERT: regex LT\(.*// loc: "EdgeRefine.cj"-17-21
// ASSERT: regex LE\(.*// loc: "EdgeRefine.cj"-21-18
// ASSERT: regex Equal\(.*// loc: "EdgeRefine.cj"-24-9
// ASSERT: regex Equal\(.*// loc: "EdgeRefine.cj"-25-18
// ASSERT: regex NotEqual\(.*// loc: "EdgeRefine.cj"-26-18
// ASSERT: regex NumericCast\(.*// loc: "EdgeRefine.cj"-33-28
// ASSERT: regex Equal\(.*// loc: "EdgeRefine.cj"-34-21
