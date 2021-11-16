package test

import java.lang.*

@java
external class InteropTest {
    public func get<T>(value: T): T { return value }
    public func test<T>(value: T): Unit {}
}
