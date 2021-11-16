package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var myList: JArray<JString>
    public func test(myList: JArray<JString>): Unit {}
}
