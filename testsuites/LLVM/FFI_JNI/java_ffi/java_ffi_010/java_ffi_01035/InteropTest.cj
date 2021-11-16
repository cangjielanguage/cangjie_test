package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<JString>
    public func getArray(): JArray<JString> { return array }
    public func test(myList: JArray<JString>): Unit {}
}
