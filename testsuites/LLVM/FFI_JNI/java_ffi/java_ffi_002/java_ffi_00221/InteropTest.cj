package test

import java.lang.*

@java
external open class InteropTest {
    public var num1: Float32 = 0.000001

    public func test(num2: Float32): Float32 { return 0.000001 }
}
