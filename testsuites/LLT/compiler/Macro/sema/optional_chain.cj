// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

struct A {
    let b: B = B()
}

struct B {
    let c: Int64 = 0
}

@M1
main() {
    let a = Some(A())
    let x = a?.b?.c
}

/* SCAN
error: cannot use optional chaining
  ==> optional_chain.cj:18:13:
   | 
18 |     let x = a?.b?.c
   |             ^ cannot use optional chaining on non-optional value of type 'Struct-B'
   | 
note: which is expanded as follows
   | 
   | /* 15.3 */    let x = a?.b?.c
   |                       ^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> optional_chain.cj:15:1:
   | 
15 |   @M1
   |  _^
16 | | main() {
   | | ...
19 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 15.1 */main() {
   |  _^
   | | /* 15.2 */    let a = Some(A())
   | | /* 15.3 */    let x = a?.b?.c
   | | /* 15.4 */}
   | | /* 15.5 */
   | |__________^
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

