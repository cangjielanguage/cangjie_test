// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f





@CallingConv[C]
foreign func foo1(): Unit

@CallingConv[X]
foreign func foo2(): Unit

@CallingConv[JS]
foreign func foo3(): Unit

@CallingConv[JAVA]
foreign func foo4(): Unit

main() {}

/* SCAN
error: '@CallingConv' have not support 'C' yet
 ==> callingconv_1.cj:7:1:
  | 
7 | @CallingConv[C]
  | ^ 
  | 

error: '@CallingConv' have not support 'X' yet
  ==> callingconv_1.cj:10:1:
   | 
10 | @CallingConv[X]
   | ^ 
   | 

error: '@CallingConv' have not support 'JS' yet
  ==> callingconv_1.cj:13:1:
   | 
13 | @CallingConv[JS]
   | ^ 
   | 

error: '@CallingConv' have not support 'JAVA' yet
  ==> callingconv_1.cj:16:1:
   | 
16 | @CallingConv[JAVA]
   | ^ 
   | 

4 errors generated, 4 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
