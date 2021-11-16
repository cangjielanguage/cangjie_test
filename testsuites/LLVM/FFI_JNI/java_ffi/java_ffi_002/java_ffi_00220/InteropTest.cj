package test

import java.lang.*

@java
external open class InteropTest <: java.lang.Object {
    public static var num1: Int32 = 0

    public static func test(): Unit { /* compiled code */ }
}
