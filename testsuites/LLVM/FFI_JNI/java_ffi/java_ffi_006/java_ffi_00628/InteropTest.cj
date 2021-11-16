package test

import java.lang.*

@java
external interface InteropTest<T, K, V> {
    func test(value1: T, value2: K, value3: V): Unit {}
}
