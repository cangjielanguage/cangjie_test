package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<JArray<Int64>>
    public func getArray(): JArray<JArray<Int64>> { return array }
    public func test(myList: JArray<JArray<Int64>>): Unit {}
}
