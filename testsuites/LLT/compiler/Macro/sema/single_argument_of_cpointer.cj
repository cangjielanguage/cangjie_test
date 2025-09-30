// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

unsafe main() {
    @M1 var ptr1 = CPointer<UInt8>(1)
    @M1 var ptr2 = CPointer<UInt8>(1, 2)
    @M1 var ptr3 = CPointer<UInt8>(CPointer<UInt8>(), 2)
    0
}

/* SCAN
error: the single argument of CPointer constructor must be 'CPointer' or 'CFunc'
 ==> single_argument_of_cpointer.cj:8:20:
  | 
8 |     @M1 var ptr1 = CPointer<UInt8>(1)
  |                    ^ 
  | 
note: which is expanded as follows
  | 
  |     /* 8.1 */var ptr1 = CPointer < UInt8 >(1)
  |                         ^^^^^^^^^^^^^^^^^^^^^ 
  | 
note: the error occurs after the macro is expanded
 ==> single_argument_of_cpointer.cj:8:5:
  | 
8 |     @M1 var ptr1 = CPointer<UInt8>(1)
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 
note: the code after the macro is expanded as follows
  | 
  |       /* 8.1 */var ptr1 = CPointer < UInt8 >(1)
  |  _____^
  | | /* 8.2 */
  | |_________^
  | 

error: too much arguments given for CPointer constructor, only accept 0~1 arguments
 ==> single_argument_of_cpointer.cj:9:20:
  | 
9 |     @M1 var ptr2 = CPointer<UInt8>(1, 2)
  |                    ^ 
  | 
note: which is expanded as follows
   | 
   |     /* 9.1 */var ptr2 = CPointer < UInt8 >(1, 2)
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
 ==> single_argument_of_cpointer.cj:9:5:
  | 
9 |     @M1 var ptr2 = CPointer<UInt8>(1, 2)
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 
note: the code after the macro is expanded as follows
   | 
   |       /* 9.1 */var ptr2 = CPointer < UInt8 >(1, 2)
   |  _____^
   | | /* 9.2 */
   | |_________^
   | 

error: too much arguments given for CPointer constructor, only accept 0~1 arguments
  ==> single_argument_of_cpointer.cj:10:20:
   | 
10 |     @M1 var ptr3 = CPointer<UInt8>(CPointer<UInt8>(), 2)
   |                    ^ 
   | 
note: which is expanded as follows
   | 
   |     /* 10.1 */var ptr3 = CPointer < UInt8 >(CPointer < UInt8 >(), 2)
   |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> single_argument_of_cpointer.cj:10:5:
   | 
10 |     @M1 var ptr3 = CPointer<UInt8>(CPointer<UInt8>(), 2)
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   |       /* 10.1 */var ptr3 = CPointer < UInt8 >(CPointer < UInt8 >(), 2)
   |  _____^
   | | /* 10.2 */
   | |__________^
   | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

