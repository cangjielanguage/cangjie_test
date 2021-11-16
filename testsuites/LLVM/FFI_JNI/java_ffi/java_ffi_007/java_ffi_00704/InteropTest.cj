package test

import java.lang.*
from ffi import java.JString

@java
external interface InteropTest {
    func test(str: JString): Unit {}
}
