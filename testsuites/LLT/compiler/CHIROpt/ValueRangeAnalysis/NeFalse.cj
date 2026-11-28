// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// The false edge of != does not refine parameters, so the later equality stays.
// DEPENDENCE: ../pick_defination.py
// EXEC: %frontendCompiler %enableO2 %disableConstPropagation --fno-chir-function-inlining %dumpCHIRDebug -Woff all %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f


func neFalse(a: Int64, b: Int64): Int64 {
    if (a != b) {
        return 1
    } else {
        let eq = a == b
        if (eq) { return 2 }
        return 3
    }
}

main() {
    return neFalse(1, 2)
}

// ASSERT: regex NotEqual\(.*// loc: "NeFalse.cj"-14-9
// ASSERT: regex Equal\(.*// loc: "NeFalse.cj"-17-18
