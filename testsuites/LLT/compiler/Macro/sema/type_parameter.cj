// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

@C
struct Data<T> {
    var a: Int64 = 0
}

main() {
    @M1
    var d0 = Data<Int64>()
    0
}

/* SCAN
error: struct with @C cannot have type parameters
 ==> type_parameter.cj:8:12:
  | 
8 | struct Data<T> {
  |            ^ 
  | 

error: struct with @C cannot have type parameters
  ==> type_parameter.cj:14:18:
   | 
14 |     var d0 = Data<Int64>()
   |                  ^ 
   | 
note: which is expanded as follows
   | 
   |     /* 13.1 */var d0 = Data < Int64 >()
   |                             ^ 
   | 
note: the error occurs after the macro is expanded
  ==> type_parameter.cj:13:5:
   | 
13 |       @M1
   |  _____^
14 | |     var d0 = Data<Int64>()
   | |__________________________^
   | 
note: the code after the macro is expanded as follows
   | 
   |       /* 13.1 */var d0 = Data < Int64 >()
   |  _____^
   | | /* 13.2 */
   | |__________^
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

