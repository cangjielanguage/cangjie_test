// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan false\nfalse\ntrue\nfalse\n

interface I {}

interface J {
    func v(): Int64
}

class Box<U> {}

open class A<X, Y> {}

extend<R> A<Box<R>, R> <: I {}

open class C<X> {}

extend<T> C<Box<T>> <: I where T <: J {}

class B <: A<Int32, Int64> {}

class Impl <: J {
    public func v(): Int64 {
        7
    }
}

main() {
    let a: Any = A<Int32, Int64>()
    println(a is I)
    let b: Any = B()
    println(b is I)
    let c: Any = C<Box<Impl>>()
    println(c is I)
    let d: Any = C<Int32>()
    println(d is I)
}
