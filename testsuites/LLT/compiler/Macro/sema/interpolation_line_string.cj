// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

@M2
class Test {
    func name() {
        let aaaa = 1
        println("  value ${aaaa + 1} abc  ${1 + cc} www")
    }
}

main() {
    return 0
}

/* SCAN
error: undeclared identifier 'cc'
  ==> interpolation_line_string.cj:11:49:
   | 
11 |         println("  value ${aaaa + 1} abc  ${1 + cc} www")
   |                                                 ^ 
   | 
note: which is expanded as follows
   | 
   | /* 7.4 */        println("  value ${aaaa + 1} abc  ${1 + cc} www")
   |                                                          ^^ 
   | 
note: the error occurs after the macro is expanded
  ==> interpolation_line_string.cj:7:1:
   | 
7  |   @M2
   |  _^
8  | | class Test {
   | | ...
13 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 7.1 */class Test {
   |  _^
   | | /* 7.2 */    func name() {
   | | /* 7.3 */        let aaaa = 1
   | | /* 7.4 */        println("  value ${aaaa + 1} abc  ${1 + cc} www")
   | | /* 7.5 */    }
   | | /* 7.6 */}
   | | /* 7.7 */let x = 1
   | | /* 7.8 */
   | |_________^
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

