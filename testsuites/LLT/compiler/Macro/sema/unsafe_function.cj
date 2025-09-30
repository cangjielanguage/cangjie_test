// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

unsafe func unsafeFunc() {
    println("call unsafeFunc")
}

class ClassWithUnsafeMember {
    unsafe func unsafeFunc() {
        println("call unsafeFunc")
    }
}

main() {
    unsafe { unsafeFunc() }
    // normal reference
    @M1 var fn = unsafeFunc
    // member access
    let obj = ClassWithUnsafeMember()
    @M0(fn = obj.unsafeFunc)
    return 0
}

/* SCAN
error: the unsafe function can only be called rather than as name reference
  ==> unsafe_function.cj:20:18:
   | 
20 |     @M1 var fn = unsafeFunc
   |                  ^ 
   | 
note: which is expanded as follows
   | 
   |     /* 20.1 */var fn = unsafeFunc
   |                        ^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> unsafe_function.cj:20:5:
   | 
20 |     @M1 var fn = unsafeFunc
   |     ^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   |       /* 20.1 */var fn = unsafeFunc
   |  _____^
   | | /* 20.2 */
   | |__________^
   | 

error: the unsafe function can only be called rather than as name reference
  ==> unsafe_function.cj:23:14:
   | 
23 |     @M0(fn = obj.unsafeFunc)
   |              ^ 
   | 
note: which is expanded as follows
   | 
   |     /* 23.1 */fn = obj.unsafeFunc
   |                    ^^^^^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> unsafe_function.cj:23:5:
   | 
23 |     @M0(fn = obj.unsafeFunc)
   |     ^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   |     /* 23.1 */fn = obj.unsafeFunc
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

