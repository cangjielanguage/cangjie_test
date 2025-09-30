// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

class A {
    public var a: Int64 = 1
}

main() {
    @M0(A().a<Bool>)
    let a1: ?A = A()
    return 0
}

/* SCAN
error: type argument's number does not match type parameter's number
  ==> type_argument_number.cj:12:9:
   | 
12 |     @M0(A().a<Bool>)
   |         ^ 
   | 
note: which is expanded as follows
   | 
   |     /* 12.1 */A().a < Bool >
   |               ^^^^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> type_argument_number.cj:12:5:
   | 
12 |     @M0(A().a<Bool>)
   |     ^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   |     /* 12.1 */A().a < Bool >
   |     ^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

