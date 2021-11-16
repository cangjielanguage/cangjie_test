package test

import java.lang.*
from ffi import java.*

@java
external interface InteropTest {
    func test(num1: Int32, num2: Int32, array: JArray<Int32>): Unit {}
}
