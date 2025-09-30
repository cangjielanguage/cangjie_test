// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

main() {
    @Letc(a)
}

/* SCAN
error: cannot assign to immutable value
 ==> cannot_assign_to_value.cj:8:11:
  | 
8 |     @Letc(a)
  |           ^ 
  | 
note: which is expanded as follows
  | 
  |     /* 8.2 */a = 2
  |              ^^^^^ 
  | 
note: the error occurs after the macro is expanded
 ==> cannot_assign_to_value.cj:8:5:
  | 
8 |     @Letc(a)
  |     ^^^^^^^^ 
  | 
note: the code after the macro is expanded as follows
  | 
  |       /* 8.1 */let a = 1;
  |  _____^
  | |     /* 8.2 */a = 2
  | |__________________^
  | 
note: variable 'a' is immutable
  | 
  |     /* 8.1 */let a = 1;
  |                  ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

