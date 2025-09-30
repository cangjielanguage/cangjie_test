// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: scan unreachable pattern
// ASSERT: scan the warning occurs after the macro is expanded
// ASSERT: scan the code after the macro is expanded as follows
// ASSERT: scan which is expanded as follows
// ASSERT: scan unused function:'func_1'
// ASSERT: scan the warning occurs after the macro is expanded
// ASSERT: scan which is expanded as follows

import define.*

public enum Enum_1 {
    defaultValue
}

@echo
private func func_1() {
    let var_1: Enum_1 = Enum_1.defaultValue;
    match (var_1) {
        case defaultValue => ()

        case _ =>
            var var_1686173962304_986: String = ###"X]m!!R.&HF"###;
            var_1686173962304_986 = """
    O${var_1686173962304_986}^${var_1686173962304_986}+[${var_1686173962304_986}XKhBkX"""
    };
    UInt8(163)
}

main(): Int64 {
    return 0;
}

