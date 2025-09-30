// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output 2>&1 | compare %f

import define.*
import std.collection.ArrayList

@M1
class A {
    let data = "aaa"
        + "test"
    let key = "class A"
    func test() {
        let errors: ArrayList<String> = ArrayList<String>()
        if (true) {
            errors.add("Sum of children pools' alloc fraction should be less than 1 got: ${data}"
                + " for pool: ${key}")
            println(errors)
        }
    }
}

@Mdiag
class B {
    func test() {
        println("bbb")
    }
}

main() {
    A().test()
    B().test()
}

/* SCAN
warning: possibly confusing line terminator
  ==> parse_nl_warning.cj:10:21:
   | 
10 |       let data = "aaa"
   |                  ~    ^ 
   |  ________________|
11 | |         + "test"
   | |_________~ possibly confusing line terminator between 'aaa' and '+'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff parser`

warning: possibly confusing line terminator
  ==> parse_nl_warning.cj:16:98:
   | 
16 |               errors.add("Sum of children pools' alloc fraction should be less than 1 got: ${data}"
   |                          ~                                                                         ^ 
   |  ________________________|
17 | |                 + " for pool: ${key}")
   | |_________________~ possibly confusing line terminator between 'Sum of children pools' alloc fraction should be less than 1 got: ${data}' and '+'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff parser`

warning: possibly confusing line terminator
   | 
   |   /* 23.8 */            "Sum of children pools' alloc fraction should be less than 1 got: ${data}"
   |                         ~                                                                         ^ 
   |  _______________________|
   | | /* 23.9 */            + " for pool: ${key}"
   | |_______________________~ possibly confusing line terminator between 'Sum of children pools' alloc fraction should be less than 1 got: ${data}' and '+'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff parser`
note: the code after the macro is expanded as follows
   | 
   |   /* 23.1 */class B {
   |  _^
   | | /* 23.2 */    let data = "aaa"
   | | /* 23.3 */    let key = "class B"
   | | /* 23.4 */    func test() {
   | | /* 23.5 */        let errors: ArrayList < String >= ArrayList < String >()
   | | /* 23.6 */        if(true) {
   | | /* 23.7 */            errors.add(
   | | /* 23.8 */            "Sum of children pools' alloc fraction should be less than 1 got: ${data}"
   | | /* 23.9 */            + " for pool: ${key}"
   | | /* 23.10 */            )
   | | /* 23.11 */            println(errors)
   | | /* 23.12 */        }
   | | /* 23.13 */    }
   | | /* 23.14 */}
   | |____________^
   | 
note: the warning occurs after the macro is expanded
  ==> parse_nl_warning.cj:23:1:
   | 
23 |   @Mdiag
   |  _^
24 | | class B {
   | | ...
28 | | }
   | |_^
   | 

3 warnings generated, 3 warnings printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

