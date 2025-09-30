// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

enum D {
    d(Int64) | d
}

enum E {
    e(D) | e
}

@M1
main(): Int64 {
    var a: E = e(d(1))
    match (a) {
        case e(d) => 1
        case e => 2
    }
}

/* SCAN
error: non-exhaustive patterns
  ==> non_exhaustive_patterns.cj:18:12:
   | 
18 |     match (a) {
   |            ^ the selector is of type 'Enum-E'
   | 
   # note: e(d(_)) is not covered
note: the error occurs after the macro is expanded
  ==> non_exhaustive_patterns.cj:15:1:
   | 
15 |   @M1
   |  _^
16 | | main(): Int64 {
   | | ...
22 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 15.1 */main(): Int64 {
   |  _^
   | | /* 15.2 */    var a: E = e(d(1))
   | | /* 15.3 */    match(a) {
   | | /* 15.4 */        case e(d) => 1
   | | /* 15.5 */        case e => 2
   | | /* 15.6 */    }
   | | /* 15.7 */}
   | | /* 15.8 */
   | |__________^
   | 
note: which is expanded as follows
   | 
   | /* 15.3 */    match(a) {
   |                     ^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

