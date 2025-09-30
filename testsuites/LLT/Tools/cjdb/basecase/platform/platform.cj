// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cmp

public platform func foo(): Unit {
	println(1111111111)
}

public platform class A {
    platform var a:Int64
    public platform A(platform public var x: Int64) {
		this.a = x
	}
	public func foo() {
		println(this.a)
	}
	public platform func foo1():Unit{
		println("111111111")
	}
}

public platform struct B {
    platform var a:Int64
    public platform B(platform public var x: Int64) {
		this.a = x
	}
	public func foo() {
		println(this.a)
	}
	public platform func foo1():Unit{
		println("111111111")
	}
}

platform enum C {
    | cs
    platform func foo(): Unit { println("platform") }
    func foo1(): Unit { println("111111111") }
}