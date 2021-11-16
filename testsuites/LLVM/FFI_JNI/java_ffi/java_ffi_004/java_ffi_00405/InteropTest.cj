package test

import java.lang.*

@java
external interface InteropTest {
    func f(i: Int32): Unit
    func test1(): Unit {}
    func test2(): Unit {}
}
