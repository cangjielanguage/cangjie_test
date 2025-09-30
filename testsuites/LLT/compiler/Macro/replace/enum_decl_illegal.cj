// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import test.*

main(): Int64 {
    @callTest( 
    enum Timeunit1 {
        Year | Month | Day | Hour
    })

    @callTest(  
    enum Timeunit2
    { Year(Int32)
    | Month(Int32, Float32)
    | Day(Int32, Float32, Float32)
    | Hour(Int32, Float32, Float32, Float32)
    })
    return 0
}

/* SCAN
error: unexpected enum declaration in function body
 ==> enum_decl_illegal.cj:9:5:
  | 
9 |     enum Timeunit1 {
  |     ^ unexpected enum declaration in function body
  | 
note: which is expanded as follows
  | 
  |     /* 8.1 */enum Timeunit1 {
  |              ^^^^ 
  | 
note: the error occurs after the macro is expanded
  ==> enum_decl_illegal.cj:8:5:
   | 
8  |       @callTest( 
   |  _____^
9  | |     enum Timeunit1 {
   | | ...
11 | |     })
   | |______^
   | 
note: the code after the macro is expanded as follows
   | 
   |       /* 8.1 */enum Timeunit1 {
   |  _____^
   | |     /* 8.2 */    Year | Month | Day | Hour
   | |     /* 8.3 */}
   | |______________^
   | 

error: unexpected enum declaration in function body
  ==> enum_decl_illegal.cj:14:5:
   | 
14 |     enum Timeunit2
   |     ^ unexpected enum declaration in function body
   | 
note: which is expanded as follows
   | 
   |     /* 13.1 */enum Timeunit2
   |               ^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> enum_decl_illegal.cj:13:5:
   | 
13 |       @callTest(  
   |  _____^
14 | |     enum Timeunit2
   | | ...
19 | |     })
   | |______^
   | 
note: the code after the macro is expanded as follows
   | 
   |       /* 13.1 */enum Timeunit2
   |  _____^
   | |     /* 13.2 */{ Year(Int32)
   | |     /* 13.3 */    | Month(Int32, Float32)
   | |     /* 13.4 */    | Day(Int32, Float32, Float32)
   | |     /* 13.5 */    | Hour(Int32, Float32, Float32, Float32)
   | |     /* 13.6 */}
   | |_______________^
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

