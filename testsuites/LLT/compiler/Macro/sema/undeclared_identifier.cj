// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

main(): Int64 {
    @M1
    var b = a + 1
    return 0
}

/* SCAN
error: undeclared identifier 'a'
 ==> undeclared_identifier.cj:9:13:
  | 
9 |     var b = a + 1
  |             ^ 
  | 
note: which is expanded as follows
  | 
  |     /* 8.1 */var b = a + 1
  |                      ^ 
  | 
note: the error occurs after the macro is expanded
 ==> undeclared_identifier.cj:8:5:
  | 
8 |       @M1
  |  _____^
9 | |     var b = a + 1
  | |_________________^
  | 
note: the code after the macro is expanded as follows
  | 
  |       /* 8.1 */var b = a + 1
  |  _____^
  | | /* 8.2 */
  | |_________^
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

