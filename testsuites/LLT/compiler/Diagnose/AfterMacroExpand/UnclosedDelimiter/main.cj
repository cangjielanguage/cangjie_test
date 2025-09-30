// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output

import std.ast.*
import cangjie_try.*

@Callback
public func t() {
}

main() {
}

/* SCAN
error: expected 'catch' or 'finally' after try block, found '<EOF>'
   | 
   |   /* 15.6 */    let a = try {
   |  _______________________~
   | | /* 15.7 */        1
   | | /* 15.8 */    }
   | |               ~^ expected 'catch' or 'finally' here
   | |_______________|
   |                 
   | 
note: the error occurs after the macro is expanded
  ==> main.cj:15:1:
   | 
15 |   @Callback
   |  _^
16 | | public func t() {
17 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 15.1 */var a = 1
   |  _^
   | | /* 15.2 */
   | | /* 15.3 */var b = 1
   | | /* 15.4 */var c = 1
   | | /* 15.5 */func u(): Unit {
   | | /* 15.6 */    let a = try {
   | | /* 15.7 */        1
   | | /* 15.8 */    }
   | |     /* 15.9 */
   | |______________^
   | 

error: unclosed delimiter: '{'
   | 
   | /* 15.5 */func u(): Unit {
   |                          ~ to match this opening '{'
   | /* 15.6 */    let a = try {
   | /* 15.7 */        1
   | /* 15.8 */    }
   |                ^ expected '}' here
   | 
note: the error occurs after the macro is expanded
  ==> main.cj:15:1:
   | 
15 |   @Callback
   |  _^
16 | | public func t() {
17 | | }
   | |_^
   | 

2 errors generated, 2 errors printed.
*/
