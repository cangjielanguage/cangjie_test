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
error: match case cannot be empty
   | 
   | /* 14.3 */        case Some(_) =>
   |                   ~~~~           ^ match case cannot be empty
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
   | | /* 14.3 */        case Some(_) =>
   | | /* 14.4 */        case None =>
   | | /* 14.5 */    }
   | | /* 14.6 */}
   | | /* 14.7 */
   | |__________^
   | 

error: match case cannot be empty
   | 
   | /* 14.4 */        case None =>
   |                   ~~~~        ^ match case cannot be empty
   | 
note: the error occurs after the macro is expanded
  ==> call.cj:14:1:
   | 
14 | @M1()
   | ^^^^^ 
   | 

2 errors generated, 2 errors printed.
*/
