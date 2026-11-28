// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan true\nfalse\n

interface J<T> {}

interface I {}

class Box<U> {}

open class A<X, Y> {}

extend<R> A<R, Box<R>> <: I where R <: J<R> {}

class Impl <: J<Impl> {}

main() {
    let a: Any = A<Impl, Box<Impl>>()
    println(a is I)
    let b: Any = A<Int32, Int64>()
    println(b is I)
}
