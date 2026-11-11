// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative: imported package state is not a known range, so main must not fold these
// comparisons into Bool constants. The true edges fall through to return 0.
// DEPENDENCE: pkg.cj ../../pick_defination.py
// EXEC: %frontendCompiler %compile_lib_opt pkg.cj -o pkg.%middle %enableO2
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation %dumpCHIRDebug -Woff all pkg.%middle %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "Func @_CN7default6<main>Hv" | compare %f

import pkg.*

let v = A.r

main() {
    if (A.a != 1) {
        return 1
    }
    if (v.start != A.a) {
        return 2
    }
    if (v.end != 5) {
        return 3
    }
    A.a = 8
    if (A.a == 8) {
        if (am.b1 == an.b1) {
            if (am.b2 >= an.b2) {
                return 0
            }
            return 6
        }
        return 5
    }
    return 4
}

// ASSERT: regex-not Bool = Constant\(
// ASSERT: regex = NotEqual\(
// ASSERT: regex = Equal\(
// ASSERT: regex = GE\(
