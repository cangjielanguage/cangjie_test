package test

import java.lang.*

@java
external interface InteropTest<T> {
    func test<K>(value1: T, value2: K): Unit {}
}
