package test

import java.lang.*

@java
external interface InteropTest<T> {
    func test(value: T): Unit {}
}
