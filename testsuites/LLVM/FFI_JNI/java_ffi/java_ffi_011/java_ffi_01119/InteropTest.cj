package test

import java.lang.*
from ffi import java.*

@java
external interface InteropTest<T> {
    func test(num1: Int32, num2: Int32, array: JArray<T>): Unit
}
