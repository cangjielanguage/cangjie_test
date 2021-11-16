package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<UInt16>
    public func getArray(): JArray<UInt16> { return array }
    public func test(myList: JArray<UInt16>): Unit {}
}
