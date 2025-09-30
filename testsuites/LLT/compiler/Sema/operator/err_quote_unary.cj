// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

main() {
    quote($(-""))
}

/* SCAN
error: import 'std.ast' to use the 'quote' expression
  ==> err_quote_unary.cj:10:5:
   | 
10 |     quote($(-""))
   |     ^^^^^^^^^^^^^ 
   | 

error: invalid unary operator '-' on type 'Struct-String'
  ==> err_quote_unary.cj:10:13:
   | 
10 |     quote($(-""))
   |             ^^^ 
   | 
   # note: you may want to implement 'operator func -()' for type 'Struct-String'

2 errors generated, 2 errors printed.
*/
