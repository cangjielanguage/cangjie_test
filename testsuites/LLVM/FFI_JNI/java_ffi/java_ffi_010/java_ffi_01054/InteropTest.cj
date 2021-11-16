package test

import java.lang.*
from ffi import java.*

@java
external open class InteropTest {
    public var array: JArray<Int64>
    public func test(a: A): Unit {}
}

@java
external open class A {
    public open func test(array: JArray<Int64>): Unit {}
}
