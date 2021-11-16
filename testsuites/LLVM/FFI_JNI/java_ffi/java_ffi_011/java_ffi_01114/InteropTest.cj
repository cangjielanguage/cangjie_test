package test

import java.lang.*
from ffi import java.*

@java
external abstract class InteropTest {
    public func test1(num1: Int32, num2: Int32, array: JArray<JString>): Unit
    public func test2(num1: Int32, num2: Int32, array: JArray<JString>): Unit {}
}
