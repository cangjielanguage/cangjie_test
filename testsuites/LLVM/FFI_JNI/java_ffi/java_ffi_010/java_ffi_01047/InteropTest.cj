package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var myList: JArray<Int32>
    public func test(myList: JArray<Int32>): Unit {}
}
