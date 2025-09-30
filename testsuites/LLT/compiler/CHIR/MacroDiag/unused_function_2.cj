// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import define.*

@M2
private func foo() {}

main() {
}

/* SCAN
warning: unused function:'foo'
  ==> unused_function_2.cj:15:1:
   | 
15 | private func foo() {}
   | ^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
note: the warning occurs after the macro is expanded
  ==> unused_function_2.cj:14:1:
   | 
14 |   @M2
   |  _^
15 | | private func foo() {}
   | |_____________________^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 14.1 */private func foo() {
   |  _^
   | | /* 14.2 */}
   | | /* 14.3 */
   | | /* 14.4 */private func testM1() { }
   | | /* 14.5 */
   | |__________^
   | 
note: which is expanded as follows
   | 
   |   /* 14.1 */private func foo() {
   |  ___________^
   | | /* 14.2 */}
   | |___________^
   | 

warning: unused function:'testM1'
   | 
   | /* 14.4 */private func testM1() { }
   |           ^^^^^^^^^^^^^^^^^^^^^^^^^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
note: the warning occurs after the macro is expanded
  ==> unused_function_2.cj:14:1:
   | 
14 |   @M2
   |  _^
15 | | private func foo() {}
   | |_____________________^
   | 

2 warnings generated, 2 warnings printed.
*/
