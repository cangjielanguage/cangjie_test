// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj %n.expect
// EXEC: %compiler %cmp_macro define.cj
// EXEC-1: %run_macro %compiler %cmp_opt  %f -o %output 2> %n.txt
// EXEC: %diff %n.expect %n.txt
import define.*

interface Data2 {
    func foo(a: Int64): Int64 {
        return 2
    }
}

open class Test1 <: Data2 {
    public func foo(): Int64 {
        return 3
    }
}

class Test <: Test1 & Data2 {}

main(): Int64 {
    var a = @Testfoo(Test()) // Test().foo
    return 0
}
