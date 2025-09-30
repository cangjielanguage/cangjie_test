// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_parallel %f -o %output

import test.*

@callTest(1+2)

@callTest((3.14, "PP"))

@callTest(r's')

@callTest(true)

@callTest("input: Tokens")

@callTest(1<2&&true)

@callTest(v1??0)

@callTest({x:Int32=>x+1})

main(): Int64 {
    return 0
}

/* SCAN
error: expected declaration, but found other node
   | 
   | /* 21.1 */{ x: Int32 => x + 1 }
   |           ^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> expr_illegal.cj:21:1:
   | 
21 | @callTest({x:Int32=>x+1})
   | ^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   | /* 21.1 */{ x: Int32 => x + 1 }
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: expected declaration, but found other node
   | 
   | /* 19.1 */v1??0
   |           ^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> expr_illegal.cj:19:1:
   | 
19 | @callTest(v1??0)
   | ^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   | /* 19.1 */v1??0
   | ^^^^^^^^^^^^^^^ 
   | 

error: expected declaration, but found other node
   | 
   | /* 17.1 */1 < 2 && true
   |           ^^^^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> expr_illegal.cj:17:1:
   | 
17 | @callTest(1<2&&true)
   | ^^^^^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   | /* 17.1 */1 < 2 && true
   | ^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: expected declaration, but found other node
   | 
   | /* 15.1 */"input: Tokens"
   |           ^^^^^^^^^^^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> expr_illegal.cj:15:1:
   | 
15 | @callTest("input: Tokens")
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   | /* 15.1 */"input: Tokens"
   | ^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: expected declaration, but found other node
   | 
   | /* 13.1 */true
   |           ^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> expr_illegal.cj:13:1:
   | 
13 | @callTest(true)
   | ^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   | /* 13.1 */true
   | ^^^^^^^^^^^^^^ 
   | 

error: expected declaration, but found other node
   | 
   | /* 11.1 */r's'
   |           ^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> expr_illegal.cj:11:1:
   | 
11 | @callTest(r's')
   | ^^^^^^^^^^^^^^^ 
   | 
note: the code after the macro is expanded as follows
   | 
   | /* 11.1 */r's'
   | ^^^^^^^^^^^^^^ 
   | 

error: expected declaration, but found other node
 ==> expr_illegal.cj:9:11:
  | 
9 | @callTest((3.14, "PP"))
  |           ^ 
  | 
note: which is expanded as follows
  | 
  | /* 9.1 */(3.14, "PP")
  |          ^^^^^^^^^^^^ 
  | 
note: the error occurs after the macro is expanded
 ==> expr_illegal.cj:9:1:
  | 
9 | @callTest((3.14, "PP"))
  | ^^^^^^^^^^^^^^^^^^^^^^^ 
  | 
note: the code after the macro is expanded as follows
  | 
  | /* 9.1 */(3.14, "PP")
  | ^^^^^^^^^^^^^^^^^^^^^ 
  | 

error: expected declaration, but found other node
 ==> expr_illegal.cj:7:11:
  | 
7 | @callTest(1+2)
  |           ^ 
  | 
note: which is expanded as follows
  | 
  | /* 7.1 */1 + 2
  |          ^^^^^ 
  | 
note: the error occurs after the macro is expanded
 ==> expr_illegal.cj:7:1:
  | 
7 | @callTest(1+2)
  | ^^^^^^^^^^^^^^ 
  | 
note: the code after the macro is expanded as follows
  | 
  | /* 7.1 */1 + 2
  | ^^^^^^^^^^^^^^ 
  | 

8 errors generated, 8 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

