// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

@M1
open class A {
    init(x: Int64) {
        this()
    }
}

main() {}

/* SCAN
error: missing argument for parameter list '(Int64)' in call
  ==> parameter_list.cj:10:13:
   | 
10 |         this()
   |             ^ expected 1 argument, found 0
   | 
note: which is expanded as follows
  | 
  | /* 7.3 */        this()
  |                      ^^ 
  | 
note: the error occurs after the macro is expanded
  ==> parameter_list.cj:7:1:
   | 
7  |   @M1
   |  _^
8  | | open class A {
   | | ...
12 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 7.1 */open class A {
   |  _^
   | | /* 7.2 */    init(x: Int64) {
   | | /* 7.3 */        this()
   | | /* 7.4 */    }
   | | /* 7.5 */}
   | | /* 7.6 */
   | |_________^
   | 
note: found candidate
  | 
  | /* 7.2 */    init(x: Int64) {
  |              ^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

