package test

import java.lang.*

@java
external class InteropTest {
    public func test<T>(value: T): Unit where T <: Animal {}
}

@java
external open class Animal {
    public var num: Int32 = 0
}
