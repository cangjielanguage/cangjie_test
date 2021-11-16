package test

import java.lang.*

@java
external open class InteropTest {
    private var num: Int32 = 0
    public func getNum(): Int32 { return num }
    public func test(n: Int32): Unit { /* compiled code */ }
}
