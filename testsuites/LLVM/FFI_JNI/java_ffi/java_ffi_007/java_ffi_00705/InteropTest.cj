package test

import java.lang.*
from ffi import java.JString

@java
external interface InteropTest {
    func getStr(): JString { return J"" }
    func test(str: JString): Unit {}
}
