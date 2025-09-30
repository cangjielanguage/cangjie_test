// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output
// ASSERT: scan expected one expr, but found exprs or other node
// ASSERT: scan the error occurs after the macro is expanded
// ASSERT: scan the code after the macro is expanded as follows

import define.*

func add(a: Int64, b: Int64): ?Int64 {
    let result = a + b

    return match {
        case @TwoExpr(a > 0) => result
        case _ => None
    }
}

main() {
    @Two var a = 1
    println(a)
    println(b)
}
