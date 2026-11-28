// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A constant match selects one successor, so the MultiBranch is gone.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func matches(): Int64 {
    let hit = match (1 + 2) {
        case 1 => 11
        case 3 => 33
        case _ => 44
    }
    let miss = match (4 + 5) {
        case 1 => 11
        case 2 => 22
        case _ => 55
    }
    return hit + miss
}

main() {
    return matches()
}

// ASSERT: regex Int64 = Constant\(33i\) // loc: "MatchFold.cj"-16-19
// ASSERT: regex Int64 = Constant\(55i\) // loc: "MatchFold.cj"-22-19
// ASSERT: regex-not MultiBranch\(.*MatchFold.cj
