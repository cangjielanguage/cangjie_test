package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var myList: JArray<Int8> = JArray<Int8>([0, 0, 0, 0, 0])
}
