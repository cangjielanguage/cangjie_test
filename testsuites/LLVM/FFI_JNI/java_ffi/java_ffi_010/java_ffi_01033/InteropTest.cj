package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<Float64>
    public func getArray(): JArray<Float64> { return array }
    public func test(myList: JArray<Float64>): Unit {}
}
