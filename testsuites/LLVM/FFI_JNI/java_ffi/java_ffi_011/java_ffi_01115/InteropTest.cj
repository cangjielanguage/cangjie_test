package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public func test<T>(num1: Int32, num2: Int32, array: JArray<T>): Unit {}
}
