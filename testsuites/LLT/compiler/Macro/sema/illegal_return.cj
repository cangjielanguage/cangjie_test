// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

@M1
func f(x!: Bool = return true, y!: Bool = x) {
    return y
}

main() {
    println(f())
}

/* SCAN
error: 'return' must be used inside a function body
 ==> illegal_return.cj:8:19:
  | 
8 | func f(x!: Bool = return true, y!: Bool = x) {
  |                   ^ 
  | 
note: which is expanded as follows
  | 
  | /* 7.1 */func f(x!: Bool = return true, y!: Bool = x) {
  |                            ^^^^^^^^^^^ 
  | 
note: the error occurs after the macro is expanded
  ==> illegal_return.cj:7:1:
   | 
7  |   @M1
   |  _^
8  | | func f(x!: Bool = return true, y!: Bool = x) {
   | | ...
10 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 7.1 */func f(x!: Bool = return true, y!: Bool = x) {
   |  _^
   | | /* 7.2 */    return y
   | | /* 7.3 */}
   | | /* 7.4 */
   | |_________^
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

