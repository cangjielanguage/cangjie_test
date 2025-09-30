// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import test.*

enum EB2 {
    | @B3
    RR3(Int64)
}

main() {
}

/* SCAN
error: unexpected enum declaration in enum body
  | 
  |     | /* 8.1 */public enum EEB {
  |                       ^^^^ unexpected enum declaration in enum body
  | 
note: the error occurs after the macro is expanded
 ==> enum_body_illegal1.cj:8:7:
  | 
8 |       | @B3
  |  _______^
9 | |     RR3(Int64)
  | |______________^
  | 
note: the code after the macro is expanded as follows
   | 
   |       | /* 8.1 */public enum EEB {
   |  _______^
   | |     /* 8.2 */    | ABC
   | |     /* 8.3 */    public func ab() { }
   | |     /* 8.4 */}
   | |______________^
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

