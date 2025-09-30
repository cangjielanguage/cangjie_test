// EXEC-PIPE-1: %compiler %cmp_opt_chir2hlir %noColor %f -o %output 2>&1 | compare %f


@C
@CallingConv[C]
func foo1() {}

@C
@CallingConv[X]
func foo2() {}

@C
@CallingConv[JavaScript]
func foo3() {}

@C
@CallingConv[Java]
func foo4() {}

main() {}

/* SCAN
error: '@CallingConv' have not support 'C' yet
 ==> callingconv_3.cj:5:1:
  | 
5 | @CallingConv[C]
  | ^ 
  | 

error: '@CallingConv' have not support 'X' yet
 ==> callingconv_3.cj:9:1:
  | 
9 | @CallingConv[X]
  | ^ 
  | 

error: '@CallingConv' have not support 'JavaScript' yet
  ==> callingconv_3.cj:13:1:
   | 
13 | @CallingConv[JavaScript]
   | ^ 
   | 

error: '@CallingConv' have not support 'Java' yet
  ==> callingconv_3.cj:17:1:
   | 
17 | @CallingConv[Java]
   | ^ 
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
