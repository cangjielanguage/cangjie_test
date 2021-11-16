package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var field: InteropTest
    public var num: Int32
    public init(num: Int32) {}
    public func test(): Unit {}
}
