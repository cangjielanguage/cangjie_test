// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: apilevel.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// ERRCHECK: %compiler %cmp_opt apilevel.%middle %n.cj -o %n.%suffix

import ohos.labels.*

const a: UInt8 = 10
const b = "xxx"

@!APILevel[a, syscap: b]
class A {
    public A() {}
}

main() {}

/* SCAN
error: only literal values are supported for now
  ==> non_literal.cj:16:12:
   | 
16 | @!APILevel[a, syscap: b]
   |            ^ 
   | 

error: only literal values are supported for now
  ==> non_literal.cj:16:23:
   | 
16 | @!APILevel[a, syscap: b]
   |                       ^ 
   | 

2 errors generated, 2 errors printed.
*/
