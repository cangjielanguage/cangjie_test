// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan none\nnone\ntrue\nfalse\ntrue\nfalse\n

interface I {}

class Box<U> {}

open class A<X, Y> {}

extend<R> A<Box<R>, R> <: I {}

class Ancestor <: A<Int32, Int64> {}

open class C<X> {}

extend<T> C<Option<T>> <: I {}

open class D<X, Y> {}

extend<T> D<Box<Box<T>>, Box<T>> <: I {}

main() {
    let a: Any = A<Int32, Int64>()
    match (a as I) {
        case Some(_) => println("some")
        case None => println("none")
    }
    let b: Any = Ancestor()
    match (b as I) {
        case Some(_) => println("some")
        case None => println("none")
    }
    let c: Any = C<Option<Int32>>()
    println(c is I)
    let d: Any = C<Int32>()
    println(d is I)
    let e: Any = D<Box<Box<Int32>>, Box<Int32>>()
    println(e is I)
    let f: Any = D<Int32, Int64>()
    println(f is I)
}
