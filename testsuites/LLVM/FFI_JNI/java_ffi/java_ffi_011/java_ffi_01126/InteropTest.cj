package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<JString>
    public func test(array: JArray<JString>): Unit {}
    public func test(arg1: JString, array: JArray<JString>): Unit {}
}
