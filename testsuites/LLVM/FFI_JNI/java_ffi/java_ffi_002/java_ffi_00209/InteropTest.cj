package test

import java.lang.*

@java
external open class InteropTest <: java.lang.Object {
    protected var num1: Int32 = 0
    protected var num2: Int32 = 0

    protected open func test(input: Int32): Unit { /* compiled code */ }
}
