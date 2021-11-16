package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<Int64>
    public func getArray(): JArray<Int64> { return array }
    public func test(myList: JArray<Int64>): Unit {}
}
