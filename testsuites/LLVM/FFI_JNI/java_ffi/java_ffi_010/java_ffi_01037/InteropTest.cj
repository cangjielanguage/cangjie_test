package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<A>
    public func getArray(): JArray<A> { return array }
    public func test(myList: JArray<A>): Unit {}
}

@java
external class A {
    var num: Int32 = 0
    init(num: Int32) {}
}
