package test

import java.lang.*
from ffi import java.JString

@java
external class InteropTest {
    var str: JString
    init(str: JString) {
        this.str = str
    }
    func test(): Unit {}
}
