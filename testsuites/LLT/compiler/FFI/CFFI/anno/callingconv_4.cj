// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f -o %output 2>&1 | compare %f


func goo1() {
    @C
    @CallingConv[CDECL]
    func foo1() {}

    unsafe { foo1() }
}

@CallingConv[CDECL]
func goo2() {}

@CallingConv[CDECL]
let f: CFunc<() -> Unit> = { => }

@CallingConv[CDECL]
struct Data1 {}

@C
@CallingConv[CDECL]
struct Data2 {}

var a = if (true) {
    @CallingConv[CDECL]
    let f: CFunc<() -> Unit> = { => }
}

class Shape {
    @CallingConv[CDECL]
    func draw() {}
}

extend Shape {
    @CallingConv[CDECL]
    func redraw() {}
}

interface Action {
    @CallingConv[CDECL]
    func go(): Unit
}

main() {}

/* SCAN
error: '@C' can only be used in top-level scope
 ==> callingconv_4.cj:5:5:
  | 
5 |     @C
  |     ^ 
  | 

error: '@CallingConv' can only be used in top-level scope
 ==> callingconv_4.cj:6:5:
  | 
6 |     @CallingConv[CDECL]
  |     ^ 
  | 

error: only CFunc can use '@CallingConv'
  ==> callingconv_4.cj:12:1:
   | 
12 | @CallingConv[CDECL]
   | ^ 
   | 

error: only CFunc can use '@CallingConv'
  ==> callingconv_4.cj:15:1:
   | 
15 | @CallingConv[CDECL]
   | ^ 
   | 

error: only CFunc can use '@CallingConv'
  ==> callingconv_4.cj:18:1:
   | 
18 | @CallingConv[CDECL]
   | ^ 
   | 

error: only CFunc can use '@CallingConv'
  ==> callingconv_4.cj:22:1:
   | 
22 | @CallingConv[CDECL]
   | ^ 
   | 

error: '@CallingConv' can only be used in top-level scope
  ==> callingconv_4.cj:26:5:
   | 
26 |     @CallingConv[CDECL]
   |     ^ 
   | 

error: '@CallingConv' can only be used in top-level scope
  ==> callingconv_4.cj:31:5:
   | 
31 |     @CallingConv[CDECL]
   |     ^ 
   | 

error: '@CallingConv' can only be used in top-level scope
  ==> callingconv_4.cj:36:5:
   | 
36 |     @CallingConv[CDECL]
   |     ^ 
   | 

error: '@CallingConv' can only be used in top-level scope
  ==> callingconv_4.cj:41:5:
   | 
41 |     @CallingConv[CDECL]
   |     ^ 
   | 

10 errors generated, 10 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
