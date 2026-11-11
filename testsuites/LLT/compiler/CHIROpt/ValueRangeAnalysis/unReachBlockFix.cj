// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %dumpCHIRDebug %enableO2 %f -o %output
// EXEC: %python pick_defination.py %n\_CHIR/[0-9]*_RangePropagation.chirtxt "." | compare %f
// EXEC: %run %run_opt %output %run_args

// ASSERT: scan Func
// ASSERT: regex-not Lambda.*goo

func hoo() { 1 << 1 }

func foo() {
    let m = hoo()
    if (m < m + 1) {
    } else {
       var a = 1
       func goo() {
           a = 2
       }
       goo()
    }
}

main() {
    foo()
}
