package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public static var array: JArray<Int8> = JArray<Int8>([0, 0])
    public static func getArray(): JArray<Int8> { return array }
    public static func test(myList: JArray<Int8>): Unit {}
}
