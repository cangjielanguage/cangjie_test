package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public func test(array: JArray<A>): Unit {}
}

@java
external class A {
    var num: Int32 = 0
    init(num: Int32) {}
}
