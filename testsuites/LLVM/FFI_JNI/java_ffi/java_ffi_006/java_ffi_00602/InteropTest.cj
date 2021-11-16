package test

import java.lang.*

@java
external class InteropTest<T> {
    var num: T
    func test(value: T): Unit {}
}
