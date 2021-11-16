package test

import java.lang.*

external open class InteropTest <: java.lang.Object {
    open func test(): Unit { /* compiled code */ }
}

external open class InteropTest2 <: java.lang.Object {
    open func test(input: Int32): Unit { /* compiled code */ }
}
