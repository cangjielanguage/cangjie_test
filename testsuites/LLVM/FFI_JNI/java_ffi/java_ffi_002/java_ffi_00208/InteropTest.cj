package test

import java.lang.*

@java
external open class InteropTest <: java.lang.Object {
    public var num1: Int32 = 0
    public var num2: Int32 = 0

    public open func test(input: Int32): Unit { /* compiled code */ }
}
