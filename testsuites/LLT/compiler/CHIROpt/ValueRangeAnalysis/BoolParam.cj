// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A bare Bool parameter is not a comparison, so the branch stays.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func flagBranch(flag: Bool): Int64 {
    if (flag) {
        return 1
    } else {
        return 2
    }
}

main() {
    return flagBranch(true)
}

// ASSERT: regex Branch\(.*// loc: "BoolParam.cj"-14-5
