package test

import java.lang.*

@java
external class InteropTest {
    public func test(a: A): Unit {}
}

@java
external open class A {
    open func test(): Unit {}
}
