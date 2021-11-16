package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var field: JString
    public func test(str: JString): Unit {}
}
