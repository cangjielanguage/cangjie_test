// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f


@CallingConv
foreign func foo1(): Unit

@C
@CallingConv
func foo2() {}

@CallingConv[1]
foreign func foo3(): Unit

@C
@CallingConv[1]
func foo4() {}

@CallingConv[1, 2]
foreign func foo5(): Unit

@C
@CallingConv[1, 2]
func foo6() {}

main() {}

/* SCAN
error: '@CallingConv' should have one arg
 ==> callingconv_5.cj:4:1:
  | 
4 | @CallingConv
  | ^ 
  | 

error: '@CallingConv' should have one arg
 ==> callingconv_5.cj:8:1:
  | 
8 | @CallingConv
  | ^ 
  | 

error: '@CallingConv' arg should be right type
  ==> callingconv_5.cj:11:1:
   | 
11 | @CallingConv[1]
   | ^ 
   | 

error: '@CallingConv' arg should be right type
  ==> callingconv_5.cj:15:1:
   | 
15 | @CallingConv[1]
   | ^ 
   | 

error: '@CallingConv' should have one arg
  ==> callingconv_5.cj:18:1:
   | 
18 | @CallingConv[1, 2]
   | ^ 
   | 

error: '@CallingConv' should have one arg
  ==> callingconv_5.cj:22:1:
   | 
22 | @CallingConv[1, 2]
   | ^ 
   | 

6 errors generated, 6 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
