package test

import java.lang.*
import java.lang.RuntimeException as JRuntimeException

@java
external class InteropTest {
    public func test1(): Unit {}
    public func test2(): Unit {}
    public func test3(): Unit {}
    public func test4(): Unit {}
    public func test5(): Unit {}
    public func test6(): Unit {}
}

@java
external class TestException <: RuntimeException {
}
