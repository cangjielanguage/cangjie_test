// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

@M1
main(): Int64 {}

/* SCAN
error: mismatched types
 ==> mismatched_types_because.cj:8:15:
  | 
8 | main(): Int64 {}
  |               ^ expected 'Int64', found 'Unit'
  | 
note: which is expanded as follows
  | 
  |   /* 7.1 */main(): Int64 {
  |  ________________________^
  | | /* 7.2 */}
  | |__________^
  | 
note: the error occurs after the macro is expanded
 ==> mismatched_types_because.cj:7:1:
  | 
7 |   @M1
  |  _^
8 | | main(): Int64 {}
  | |________________^
  | 
note: the code after the macro is expanded as follows
  | 
  |   /* 7.1 */main(): Int64 {
  |  _^
  | | /* 7.2 */}
  | | /* 7.3 */
  | |_________^
  | 
note: expected 'Int64' because of return type
  | 
  | /* 7.1 */main(): Int64 {
  |                  ^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

