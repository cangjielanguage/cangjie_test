package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public func test(cls: A): Unit {}
}

@java
external open class A {
    var str: JString = J""
}
