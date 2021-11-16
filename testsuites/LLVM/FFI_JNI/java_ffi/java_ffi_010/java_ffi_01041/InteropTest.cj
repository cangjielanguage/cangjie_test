package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest<T> {
    public var array: JArray<T>
    public func getArray(): JArray<T> { return array }
    public func test(myList: JArray<T>): Unit {}
}
