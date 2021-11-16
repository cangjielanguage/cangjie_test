package test

import java.lang.*
from ffi import java.*

@java
external interface InteropTest {
    func getArray(): JArray<Int8>
    func test(myList: JArray<Int8>): Unit
}
