package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var myList: JArray<JArray<Int32>>
}
