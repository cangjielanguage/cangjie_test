// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import test.*

main(): Int64 {
    // test vardecl initializer callmacro return binaryexpr tokens
    var a: Int32 = @callTest(1 + 2)
    if (a != 3) {
        print("test vardecl init call macro failed\n")
        return 1
    }

    // test assign expr callmacro return two expr tokens
    a = @callTest(1 2)
    if (a != 1) {
        print("test assign expr call macro failed\n")
        return 1
    }

    return 0
}

/* SCAN
error: expected ';' or '<NL>', found literal '2'
   | 
   |     a = /* 16.1 */1 2
   |                     ^ expected ';' or '<NL>' here
   | 
note: the error occurs after the macro is expanded
  ==> var_init_check.cj:16:9:
   | 
16 |     a = @callTest(1 2)
   |         ^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   |     a = /* 16.1 */1 2
   |         ^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
