package test

import java.lang.*

@java
external class InteropTest<T> {
    public func test<K>(value1: T, value2: K): Unit {}
}
