// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f

@CallingConv
@C
func foo1() {}

@CallingConv[1]
@C
func foo2() {}

@CallingConv[1, 2]
@C
func foo3() {}

@CallingConv[CDECL]
@C
struct Data {}

main() {}

/* SCAN
error: '@CallingConv' should have one arg
 ==> callingconv_6.cj:3:1:
  | 
3 | @CallingConv
  | ^ 
  | 

error: '@CallingConv' arg should be right type
 ==> callingconv_6.cj:7:1:
  | 
7 | @CallingConv[1]
  | ^ 
  | 

error: '@CallingConv' should have one arg
  ==> callingconv_6.cj:11:1:
   | 
11 | @CallingConv[1, 2]
   | ^ 
   | 

error: only CFunc can use '@CallingConv'
  ==> callingconv_6.cj:15:1:
   | 
15 | @CallingConv[CDECL]
   | ^ 
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
