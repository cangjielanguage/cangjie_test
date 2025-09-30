// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f

@C
class Person {
    @C
    var age_: Int64 = 0

    @C
    mut prop age: Int64 {
        get() { age_ }

        set(v) { age_ = v }
    }

    @C
    func sayHi() {}

    @C
    init(age: Int64) {
        age_ = age
    }

    @C
    Person(name: String) { }
}

var a = if (true) {
    @C
    func sayHi() {}
}

@C
main() {}

/* SCAN
error: class cannot be modified with '@C'
 ==> c_1.cj:3:1:
  | 
3 | @C
  | ^ 
  | 

error: variable cannot be modified with '@C'
 ==> c_1.cj:5:5:
  | 
5 |     @C
  |     ^ 
  | 

error: property cannot be modified with '@C'
 ==> c_1.cj:8:5:
  | 
8 |     @C
  |     ^ 
  | 

error: '@C' can only be used in top-level scope
  ==> c_1.cj:15:5:
   | 
15 |     @C
   |     ^ 
   | 

error: '@C' can only be used in top-level scope
  ==> c_1.cj:18:5:
   | 
18 |     @C
   |     ^ 
   | 

error: '@C' can only be used in top-level scope
  ==> c_1.cj:23:5:
   | 
23 |     @C
   |     ^ 
   | 

error: '@C' can only be used in top-level scope
  ==> c_1.cj:28:5:
   | 
28 |     @C
   |     ^ 
   | 

error: main cannot be modified with '@C'
  ==> c_1.cj:32:1:
   | 
32 | @C
   | ^ 
   | 

8 errors generated, 8 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
