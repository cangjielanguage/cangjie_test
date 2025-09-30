// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output
import define.*

open class C {
    public func foo(a: Int32) {
        return a
    }
}

interface I<T> {
    func foo(a: T) {
        return a
    }
}

func Foo<U>(a: U) where U <: C & I<U> {
    @M0 var d = a.bar()
}

main() {}

/* SCAN
error: 'bar' is not found for generic type 'U' in its upper bounds
  ==> not_found_in_upper.cj:19:19:
   | 
19 |     @M0 var d = a.bar()
   |                   ^ 
   | 
note: which is expanded as follows
   | 
   |     /* 19.1 */var d = a.bar()
   |                         ^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> not_found_in_upper.cj:19:5:
   | 
19 |     @M0 var d = a.bar()
   |     ^^^^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   |     /* 19.1 */var d = a.bar()
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

