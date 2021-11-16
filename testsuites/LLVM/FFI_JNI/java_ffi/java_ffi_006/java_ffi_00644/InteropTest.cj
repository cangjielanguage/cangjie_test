package test

import java.lang.*

@java
external class InteropTest {
    func test<T, K, V>(value1: T, value2: K, value3: V): Unit {}
}
