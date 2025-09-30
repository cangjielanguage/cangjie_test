// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import test.*

@callTest(func23)

main(): Int64 {
    return 0
}

/* SCAN
error: expected declaration, but found other node
 ==> ref_illegal.cj:7:11:
  | 
7 | @callTest(func23)
  |           ^ 
  | 
note: which is expanded as follows
  | 
  | /* 7.1 */func23
  |          ^^^^^^ 
  | 
note: the error occurs after the macro is expanded
 ==> ref_illegal.cj:7:1:
  | 
7 | @callTest(func23)
  | ^^^^^^^^^^^^^^^^^ 
  | 
note: the code after the macro is expanded as follows
  | 
  | /* 7.1 */func23
  | ^^^^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

