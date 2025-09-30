// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

@M1
class Base12 {
    public var du: Int64 = 1
    public prop a: Int64 {
    }
    public func f(): Int64 {
        a = 2
        return 0
    }
}

@M1
main() {
    var x = Base12()
    if (x.a == 4) {
        return 0
    }
    return 1
}

/* SCAN
error: property must have accessors
  ==> not_a_member.cj:10:5:
   | 
10 |     public prop a: Int64 {
   |     ^ 
   | 
note: which is expanded as follows
   | 
   |   /* 7.3 */    public prop a: Int64 {
   |  ______________^
   | | /* 7.4 */    }
   | |______________^
   | 
note: the error occurs after the macro is expanded
  ==> not_a_member.cj:7:1:
   | 
7  |   @M1
   |  _^
8  | | class Base12 {
   | | ...
16 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 7.1 */class Base12 {
   |  _^
   | | /* 7.2 */    public var du: Int64 = 1
   | | /* 7.3 */    public prop a: Int64 {
   | | /* 7.4 */    }
   | | /* 7.5 */    public func f(): Int64 {
   | | /* 7.6 */        a = 2
   | | /* 7.7 */        return 0
   | | /* 7.8 */    }
   | | /* 7.9 */}
   | | /* 7.10 */
   | |__________^
   | 

error: 'a' is not a member of class 'Base12'
  ==> not_a_member.cj:21:11:
   | 
21 |     if (x.a == 4) {
   |           ^ 
   | 
note: which is expanded as follows
   | 
   | /* 18.3 */    if(x.a == 4) {
   |                    ^ 
   | 
note: the error occurs after the macro is expanded
  ==> not_a_member.cj:18:1:
   | 
18 |   @M1
   |  _^
19 | | main() {
   | | ...
25 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 18.1 */main() {
   |  _^
   | | /* 18.2 */    var x = Base12()
   | | /* 18.3 */    if(x.a == 4) {
   | | /* 18.4 */        return 0
   | | /* 18.5 */    }
   | | /* 18.6 */    return 1
   | | /* 18.7 */}
   | | /* 18.8 */
   | |__________^
   | 

error: cannot assign to immutable value
  ==> not_a_member.cj:13:9:
   | 
13 |         a = 2
   |         ^ 
   | 
note: which is expanded as follows
   | 
   | /* 7.6 */        a = 2
   |                  ^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> not_a_member.cj:7:1:
   | 
7  |   @M1
   |  _^
8  | | class Base12 {
   | | ...
16 | | }
   | |_^
   | 
note: property 'a' is immutable
  | 
  | /* 7.3 */    public prop a: Int64 {
  |                          ^ 
  | 

3 errors generated, 3 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

