// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import test.*

@callTest
var vb = @OverflowWrapping {=> Int8(32)}

@callTest
foreign var fva = 2

main(): Int64 {
    @callTest(var a = 0)
    @callTest
    var b: Int64 = 1
    @callTest var (x, y) = (1, 1)
    return 0
}

/* SCAN
error: variable can not be modified with 'foreign' and implicit @C.
  ==> var_decl.cj:11:1:
   | 
11 | foreign var fva = 2
   | ^ 
   | 
note: which is expanded as follows
  | 
  | /* 10.1 */foreign var fva = 2
  |           ^^^^^^^^^^^^^^^^^^^ 
  | 
note: the error occurs after the macro is expanded
  ==> var_decl.cj:10:1:
   | 
10 |   @callTest
   |  _^
11 | | foreign var fva = 2
   | |___________________^
   | 
note: the code after the macro is expanded as follows
  | 
  | /* 10.1 */foreign var fva = 2
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
