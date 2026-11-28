// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A match on an unknown value stays a MultiBranch.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func matchUnk(a: Int64): Int64 {
    match (a) {
        case 1 => 1
        case _ => 0
    }
}

main() {
    return matchUnk(1)
}

// ASSERT: regex MultiBranch\(.*// loc: "MatchUnk.cj"-14-5
