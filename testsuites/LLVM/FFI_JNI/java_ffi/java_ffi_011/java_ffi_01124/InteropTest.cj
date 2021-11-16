package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public func test(array: JArray<Int8>): Unit {}
    public func test(arg1: Int8, arg2: Int8): Unit {}
}
