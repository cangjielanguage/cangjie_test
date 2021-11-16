package test

import java.lang.*

@java
external interface InteropTest<T> {
    func get(value: T): T
    func test(value: T): Unit {}
}
