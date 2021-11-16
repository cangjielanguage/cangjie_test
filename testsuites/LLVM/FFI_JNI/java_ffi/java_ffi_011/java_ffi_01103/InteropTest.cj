package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<UInt16>
    public func getArray(str: JString): JArray<UInt16> { return array }
    public func test(array: JArray<UInt16>): Unit {}
}
