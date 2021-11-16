package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public func test(myList: JArray<Int64>): Unit {}
}
