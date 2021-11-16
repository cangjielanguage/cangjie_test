package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<Int16>
    public func getArray(): JArray<Int16> { return array }
    public func test(myList: JArray<Int16>): Unit {}
}
