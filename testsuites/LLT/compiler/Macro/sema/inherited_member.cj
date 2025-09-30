// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

interface I0 {
    func test() {}
}

interface I1 {
    prop test: Int64 {
        get() {
            1
        }
    }
}

@M1
class A <: I0 & I1 {}

main() {
    return 0
}

/* SCAN
error: inherited members 'test' have inconsistent decl types
  ==> inherited_member.cj:20:7:
   | 
20 | class A <: I0 & I1 {}
   |       ^ 
   | 
note: which is expanded as follows
   | 
   | /* 19.1 */class A <: I0 & I1 {
   |                 ^ 
   | 
note: the error occurs after the macro is expanded
  ==> inherited_member.cj:19:1:
   | 
19 |   @M1
   |  _^
20 | | class A <: I0 & I1 {}
   | |_____________________^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 19.1 */class A <: I0 & I1 {
   |  _^
   | | /* 19.2 */}
   | | /* 19.3 */
   | |__________^
   | 
note: function member
 ==> inherited_member.cj:8:10:
  | 
8 |     func test() {}
  |          ^^^^ 
  | 
note: property member
  ==> inherited_member.cj:12:10:
   | 
12 |     prop test: Int64 {
   |          ^^^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

