// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

interface I2 {}

extend Int32 <: I2 {}

extend Unit <: I2 {}

extend<T> CPointer<T> <: I2 where T <: I2 {}

@M1
var node19: I2 = CPointer()

@M1
var node20: I2 = CPointer<Int64>()

@M1
var node21: I2 = CPointer(CPointer<Int64>())

main() {}

/* SCAN
error: 'CPointer' generic type cannot be inferred
  ==> cannot_infer_generic_type.cj:16:18:
   | 
16 | var node19: I2 = CPointer()
   |                  ^ 
   | 
note: which is expanded as follows
   | 
   | /* 15.1 */var node19: I2 = CPointer()
   |                            ^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> cannot_infer_generic_type.cj:15:1:
   | 
15 |   @M1
   |  _^
16 | | var node19: I2 = CPointer()
   | |___________________________^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 15.1 */var node19: I2 = CPointer()
   |  _^
   | | /* 15.2 */
   | |__________^
   | 

error: mismatched types
  ==> cannot_infer_generic_type.cj:19:18:
   | 
19 | var node20: I2 = CPointer<Int64>()
   |                  ^ expected 'Interface-I2', found 'CPointer<Int64>'
   | 
note: which is expanded as follows
   | 
   | /* 18.1 */var node20: I2 = CPointer < Int64 >()
   |                            ^^^^^^^^^^^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> cannot_infer_generic_type.cj:18:1:
   | 
18 |   @M1
   |  _^
19 | | var node20: I2 = CPointer<Int64>()
   | |__________________________________^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 18.1 */var node20: I2 = CPointer < Int64 >()
   |  _^
   | | /* 18.2 */
   | |__________^
   | 

error: 'CPointer' generic type cannot be inferred
  ==> cannot_infer_generic_type.cj:22:18:
   | 
22 | var node21: I2 = CPointer(CPointer<Int64>())
   |                  ^ 
   | 
note: which is expanded as follows
   | 
   | /* 21.1 */var node21: I2 = CPointer(CPointer < Int64 >())
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> cannot_infer_generic_type.cj:21:1:
   | 
21 |   @M1
   |  _^
22 | | var node21: I2 = CPointer(CPointer<Int64>())
   | |____________________________________________^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 21.1 */var node21: I2 = CPointer(CPointer < Int64 >())
   |  _^
   | | /* 21.2 */
   | |__________^
   | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

