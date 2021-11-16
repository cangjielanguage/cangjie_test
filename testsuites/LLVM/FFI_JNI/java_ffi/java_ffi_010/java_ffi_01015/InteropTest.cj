package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var myList: JArray<Int64> = [0, 0, 0, 0, 0].ToJArray()
}
