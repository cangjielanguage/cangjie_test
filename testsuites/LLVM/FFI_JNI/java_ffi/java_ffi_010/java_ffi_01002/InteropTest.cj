package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var myList: JArray<Int16> = JArray<Int16>([0, 0, 0, 0, 0])
}
