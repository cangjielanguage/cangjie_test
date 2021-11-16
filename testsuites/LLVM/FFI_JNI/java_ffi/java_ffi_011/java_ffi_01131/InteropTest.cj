package test

import java.lang.*
from ffi import java.*

@java
external interface InteropTest {
    func test(array: JArray<Int64>): Unit {}
}
