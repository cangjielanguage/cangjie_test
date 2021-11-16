package test

import java.lang.*

@java
external open class InteropTest {
    public open func get<T>(value: T): T { return value }
    public func test(value: Integer): Unit {}
}
