// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import test.*

main(): Int64 {
    @callTest(interface A{})
    return 0
}

/* SCAN
error: unexpected interface declaration in function body
 ==> interface_decl_illegal1.cj:8:15:
  | 
8 |     @callTest(interface A{})
  |               ^ unexpected interface declaration in function body
  | 
note: which is expanded as follows
  | 
  |     /* 8.1 */interface A { }
  |              ^^^^^^^^^ 
  | 
note: the error occurs after the macro is expanded
 ==> interface_decl_illegal1.cj:8:5:
  | 
8 |     @callTest(interface A{})
  |     ^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 
note: the code after the macro is expanded as follows
  | 
  |     /* 8.1 */interface A { }
  |     ^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

