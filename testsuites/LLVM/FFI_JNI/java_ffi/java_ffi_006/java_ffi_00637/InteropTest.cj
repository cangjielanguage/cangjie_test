package test

import java.lang.*

@java
external open class InteropTest {
    public open func get<T>(value: T): java.lang.Object { return java.lang.Object() }
    public func test(value: Integer): Unit {}
}
