package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public func getArray(): JArray<Int8> { return JArray<Int8>([0]) }
    public func test(myList: JArray<Int8>): Unit {}
}
