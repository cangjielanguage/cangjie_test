package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public func test(myList: JArray<A>): Unit {}
}

@java
external open class A {
    var num: Int32 = 0
    init(num: Int32) {}
}
