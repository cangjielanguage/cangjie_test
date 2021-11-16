package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var myList: JArray<Float64>
    public func test(): Unit {}
}
