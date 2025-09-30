// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f

class Person {}

@C
extend Person {
    @C
    func sayHi() {}
}

main() {}

/* SCAN
error: extend cannot be modified with '@C'
 ==> c_0.cj:5:1:
  | 
5 | @C
  | ^ 
  | 

error: '@C' can only be used in top-level scope
 ==> c_0.cj:7:5:
  | 
7 |     @C
  |     ^ 
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
