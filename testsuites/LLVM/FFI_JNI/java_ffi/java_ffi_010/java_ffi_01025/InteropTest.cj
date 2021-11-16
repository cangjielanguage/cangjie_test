package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public func test(myList: JArray<JArray<Int32>>): Unit {}
}
