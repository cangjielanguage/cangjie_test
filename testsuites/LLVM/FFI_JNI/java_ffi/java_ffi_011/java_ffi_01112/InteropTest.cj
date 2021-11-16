package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public func test(num1: Int32, num2: Int32, array: JArray<Int8>): Unit {}
}
