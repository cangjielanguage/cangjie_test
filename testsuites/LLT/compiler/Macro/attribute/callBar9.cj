// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroBar.cj
// EXEC: %compiler %cmp_macro macroBar.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output
// ASSERT: scan undeclared identifier 'Bar'
// ASSERT: scan which is expanded as follows
// ASSERT: scan the error occurs after the macro is expanded
// ASSERT: scan the code after the macro is expanded as follows

import pkg2.*

main(): Int64 {
    var a = @Bar[\@Foo](\@Bar[1](5))
    if (a != 5) {
        return 1
    }
    0
}


