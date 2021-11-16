package test

import java.lang.*
from ffi import java.*

@java
external open class InteropTest {
    public func test(a: A): Unit {}
}

@java
external open class A {
    public open func test(): Unit {}
}
