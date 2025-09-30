// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

@M1
struct Test {
    private Test(var name: String) {}
    init(name: String) {}
}

main() {}

/* SCAN
error: constructor 'init' has overload conflicts
  ==> overload_conflict.cj:10:5:
   | 
10 |     init(name: String) {}
   |     ^ 
   | 
note: which is expanded as follows
   | 
   | /* 7.4 */    init(name: String) {
   |              ^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> overload_conflict.cj:7:1:
   | 
7  |   @M1
   |  _^
8  | | struct Test {
   | | ...
11 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 7.1 */struct Test {
   |  _^
   | | /* 7.2 */    private Test(var name: String) {
   | | /* 7.3 */    }
   | | /* 7.4 */    init(name: String) {
   | | /* 7.5 */    }
   | | /* 7.6 */}
   | | /* 7.7 */
   | |_________^
   | 
note: conflict with the declaration
  | 
  | /* 7.2 */    private Test(var name: String) {
  |                      ^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

