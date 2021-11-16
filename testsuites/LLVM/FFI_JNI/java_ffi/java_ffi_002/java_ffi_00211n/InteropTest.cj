package test

import java.lang.*

external open class InteropTest <: java.lang.Object {
    private var num1: Int32 = 0
    private var num2: Int32 = 0

    private func test(input: Int32): Unit { /* compiled code */ }
}
