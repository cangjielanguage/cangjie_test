package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<Bool>
    public func getArray(): JArray<Bool> { return array }
    public func test(myList: JArray<Bool>): Unit {}
}
