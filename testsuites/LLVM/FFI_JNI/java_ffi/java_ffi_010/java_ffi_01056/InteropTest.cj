package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var array: JArray<JArray<Int32>>
    public func test(myList: JArray<JArray<Int32>>): JArray<JArray<Int32>> { return myList }
}
