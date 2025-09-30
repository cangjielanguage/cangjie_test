// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import view.*

enum Eb1 {
    | Red
    | Red(Int64)
    | @M(func gggsss(){})
}

main() {}

/* SCAN
error: expected an enum constructor
  ==> enum_case_17.cj:10:10:
   | 
10 |     | @M(func gggsss(){})
   |          ^ 
   | 
note: which is expanded as follows
   | 
   |     | /* 10.1 */func gggsss() { }
   |                 ^^^^^^^^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> enum_case_17.cj:10:7:
   | 
10 |     | @M(func gggsss(){})
   |       ^^^^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   |     | /* 10.1 */func gggsss() { }
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

