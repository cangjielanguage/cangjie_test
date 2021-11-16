package test

import java.lang.*

@java
external interface InteropTest<T> {
    func get(value: T): java.lang.Object
    func test(value: T): Unit {}
}
