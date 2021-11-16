package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var field: InteropTest
    public static func test(): Unit {}
}
