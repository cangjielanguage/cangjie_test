package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public func test(array: JArray<Int64>): Unit {}
}
