// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

@M1
func foo<T>(a: T) {
    bar<Int64>(1)
    a
}

func bar<T>(a: T) {
    baz(foo<Int64>(1)) // Use unknown as function call
    a
}

func baz<T>(a: T): T {
    a
}

main() {}

/* SCAN
error: unable to infer return type, please add type annotation
 ==> generic.cj:8:6:
  | 
8 | func foo<T>(a: T) {
  |      ^ 
  | 
note: which is expanded as follows
  | 
  | /* 7.1 */func foo < T >(a: T) {
  |               ^^^^ 
  | 
note: the error occurs after the macro is expanded
  ==> generic.cj:7:1:
   | 
7  |   @M1
   |  _^
8  | | func foo<T>(a: T) {
   | | ...
11 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 7.1 */func foo < T >(a: T) {
   |  _^
   | | /* 7.2 */    bar < Int64 >(1)
   | | /* 7.3 */    a
   | | /* 7.4 */}
   | | /* 7.5 */
   | |_________^
   | 
note: with recursive usage from
  ==> generic.cj:14:9:
   | 
14 |     baz(foo<Int64>(1)) // Use unknown as function call
   |         ^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

