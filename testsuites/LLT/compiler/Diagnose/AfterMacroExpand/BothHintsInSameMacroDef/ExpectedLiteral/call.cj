// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import define.*

@M1()

main() {
    println("Hello World\n")
}

/* SCAN
error: expected literal after '-', found '=>'
   | 
   | /* 14.3 */        case - => 1
   |                        ~ ^^ expected literal here
   |                        |
   |                        after this
   | 
note: the error occurs after the macro is expanded
  ==> call.cj:14:1:
   | 
14 | @M1()
   | ^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 14.1 */func yo() {
   |  _^
   | | /* 14.2 */    match(Some(1)) {
   | | /* 14.3 */        case - => 1
   | | /* 14.4 */        case _ => 2
   | | /* 14.5 */    }
   | | /* 14.6 */}
   | | /* 14.7 */
   | |__________^
   | 

1 error generated, 1 error printed.
*/
