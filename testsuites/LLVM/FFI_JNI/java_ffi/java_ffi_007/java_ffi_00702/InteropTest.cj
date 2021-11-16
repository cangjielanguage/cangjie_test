package test

import java.lang.*
from ffi import java.JString

@java
external class InteropTest {
    func test(str: JString): Unit {}
}
