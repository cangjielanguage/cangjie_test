package test

import java.lang.*
from ffi import java.JString

@java
external open class InteropTest {
    var str: JString = J"in InteropTest"
    public open func getStr(): JString { return J"" }
    func test(interoptest: InteropTest): Unit {}
}
