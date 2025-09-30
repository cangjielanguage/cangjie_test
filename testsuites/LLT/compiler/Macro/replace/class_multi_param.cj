// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output
// ASSERT: scan expected ';' or '<NL>', found keyword 'var'
// ASSERT: scan the error occurs after the macro is expanded
// ASSERT: scan the code after the macro is expanded as follows
// ASSERT: scan expected ';' or '<NL>', found keyword 'var'
// ASSERT: scan the error occurs after the macro is expanded
// ASSERT: scan the code after the macro is expanded as follows

import test.*

public class A {
    @MultiParam1
    public var a: Int8 = 0

    @MultiParam2[c + d]
    public var c: Int8 = 2
}

main(): Int64 {
    return 0
}


