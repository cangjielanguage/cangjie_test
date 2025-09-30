// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

open class A<T> {}

@M1
class B<T, V> <: A<T, V> {}

main() {
    return 0
}

/* SCAN
error: type argument's number does not match type parameter's number
  ==> type_argument_number_generic.cj:10:18:
   | 
10 | class B<T, V> <: A<T, V> {}
   |                  ^ 
   | 
note: which is expanded as follows
  | 
  | /* 9.1 */class B < T, V > <: A < T, V > {
  |                              ^^^^^^^^^^ 
  | 
note: the error occurs after the macro is expanded
  ==> type_argument_number_generic.cj:9:1:
   | 
9  |   @M1
   |  _^
10 | | class B<T, V> <: A<T, V> {}
   | |___________________________^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 9.1 */class B < T, V > <: A < T, V > {
   |  _^
   | | /* 9.2 */}
   | | /* 9.3 */
   | |_________^
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

