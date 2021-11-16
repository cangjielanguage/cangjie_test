package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<Float32>
    public func getArray(): JArray<Float32> { return array }
    public func test(myList: JArray<Float32>): Unit {}
}
