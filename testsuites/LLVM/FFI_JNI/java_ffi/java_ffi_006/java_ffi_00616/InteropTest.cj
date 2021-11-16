package test

import java.lang.*

@java
external interface InteropTest<T> {
    func get(value: T): T { return value }
    func test(value: T): Unit {}
}
