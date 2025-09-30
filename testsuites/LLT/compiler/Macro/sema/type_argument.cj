// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

class A {
    func test<T>() {
        1
    }
    private func test(a: Int64) {
        2
    }
}

main() {
    let a = A()
    @M1 let b = a.test
    return 0
}

/* SCAN
error: type arguments needed for the generic function 'test'
  ==> type_argument.cj:18:19:
   | 
18 |     @M1 let b = a.test
   |                   ^ cannot infer type arguments for the generic function
   | 
note: which is expanded as follows
   | 
   |     /* 18.1 */let b = a.test
   |                         ^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> type_argument.cj:18:5:
   | 
18 |     @M1 let b = a.test
   |     ^^^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   |       /* 18.1 */let b = a.test
   |  _____^
   | | /* 18.2 */
   | |__________^
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

