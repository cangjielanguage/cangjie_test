// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %macro_debug %f -o %output 2>&1 | compare %f

import define.*

@M2
private func foo() {}

main() {
}

/* SCAN
warning: unused function:'foo'
  ==> unused_function_2_debug_macro.cj.macrocall:15:11:
   | 
15 |   /* 14.1 */private func foo() {
   |  ___________^
16 | | /* 14.2 */}
   | |___________^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused function:'testM1'
  ==> unused_function_2_debug_macro.cj.macrocall:18:11:
   | 
18 | /* 14.4 */private func testM1() { }
   |           ^^^^^^^^^^^^^^^^^^^^^^^^^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
