// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import view.*

enum Eb1 {
    | Red
    | Red(Int64)
    | @AA3[Red(Int64, Int64)]
    gggsss2(Int64)
}

main() {}

/* SCAN
error: expected one enum constructor, but found more than one node
  ==> enum_case_20.cj:11:5:
   | 
11 |     gggsss2(Int64)
   |     ^ 
   | 
note: which is expanded as follows
   | 
   |     | /* 10.1 */Red(Int64, Int64); gggsss2(Int64)
   |                                    ^^^^^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> enum_case_20.cj:10:7:
   | 
10 |       | @AA3[Red(Int64, Int64)]
   |  _______^
11 | |     gggsss2(Int64)
   | |__________________^
   | 
note: the code after the macro is expanded as follows
   | 
   |     | /* 10.1 */Red(Int64, Int64); gggsss2(Int64)
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

