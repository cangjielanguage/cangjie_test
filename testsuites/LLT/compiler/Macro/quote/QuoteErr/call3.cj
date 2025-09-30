// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK:  %run_macro %compiler %cmp_opt  %f -o %output
// ASSERT: scan expected ';' or '<NL>', found literal '1'
// ASSERT: scan which is expanded as follows
// ASSERT: scan the error occurs after the macro is expanded
// ASSERT: scan the code after the macro is expanded as follows

import define.*

main() {
    @N[;var b = 1](1)
    0
}

