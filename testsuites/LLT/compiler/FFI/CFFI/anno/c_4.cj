// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f

@C
func foo<T>(x: T) {
    x
}

func outer() {
    @C
    func inner() {}

    unsafe { inner() }
}

main() { 0 }

/* SCAN
error: CFunc cannot have type parameters
 ==> c_4.cj:4:9:
  | 
4 | func foo<T>(x: T) {
  |         ^ 
  | 

error: '@C' can only be used in top-level scope
 ==> c_4.cj:9:5:
  | 
9 |     @C
  |     ^ 
  | 

error: arguments type of CFunc must be instantiated with CType
 ==> c_4.cj:4:13:
  | 
4 | func foo<T>(x: T) {
  |             ^^^^ 
  | 

error: return type of CFunc must be instantiated with CType
 ==> c_4.cj:4:6:
  | 
4 | func foo<T>(x: T) {
  |      ^^^ 
  | 
  # note: return type is Generics-T

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
