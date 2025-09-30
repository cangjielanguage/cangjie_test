// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

class A {}

@M1
extend A {
    public static func f(a: Int8) {}
    public func f() {}
}

main() {}

/* SCAN
error: overloaded functions 'f' cannot mix static and non-static
  ==> overload_function.cj:11:24:
   | 
11 |     public static func f(a: Int8) {}
   |                        ^ 
   | 
note: which is expanded as follows
   | 
   | /* 9.2 */    public static func f(a: Int8) {
   |                                 ^ 
   | 
note: the error occurs after the macro is expanded
  ==> overload_function.cj:9:1:
   | 
9  |   @M1
   |  _^
10 | | extend A {
   | | ...
13 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 9.1 */extend A {
   |  _^
   | | /* 9.2 */    public static func f(a: Int8) {
   | | /* 9.3 */    }
   | | /* 9.4 */    public func f() {
   | | /* 9.5 */    }
   | | /* 9.6 */}
   | | /* 9.7 */
   | |_________^
   | 
note: non-static function is here
   | 
   | /* 9.4 */    public func f() {
   |                          ^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

