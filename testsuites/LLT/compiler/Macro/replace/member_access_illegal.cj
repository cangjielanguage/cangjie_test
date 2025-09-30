// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import test.*

@callTest
enum EE1 {
    Red | Green
}

@callTest(EE1.)

main(): Int64 {
    return 0
}

/* SCAN
error: expected a member name after '.' in qualified name, found '<EOF>'
   | 
   | /* 12.1 */EE1.
   |              ~^ expected a member name here
   |              |
   |              after '.' in qualified name
   | 
note: the error occurs after the macro is expanded
  ==> member_access_illegal.cj:12:1:
   | 
12 | @callTest(EE1.)
   | ^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   | /* 12.1 */EE1.
   | ^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

