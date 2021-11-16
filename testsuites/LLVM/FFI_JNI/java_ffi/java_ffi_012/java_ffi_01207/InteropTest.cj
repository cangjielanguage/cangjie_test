package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public func test(cls: A): Unit {}
}

@java
external interface A {
    func test(): Unit {}
}
