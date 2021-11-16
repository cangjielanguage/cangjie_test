package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<Int32>
    public func getArray(): JArray<Int32> { return array }
    public func test(myList: JArray<Int32>): Unit {}
}
