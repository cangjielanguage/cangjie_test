// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f

@CallingConv[CDECL]
class A {}

main() {}

/* SCAN
error: only CFunc can use '@CallingConv'
 ==> callingconv_7.cj:3:1:
  | 
3 | @CallingConv[CDECL]
  | ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
