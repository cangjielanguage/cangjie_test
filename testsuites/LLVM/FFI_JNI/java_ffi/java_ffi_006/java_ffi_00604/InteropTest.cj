package test

import java.lang.*

@java
external open class InteropTest<T> {
    open func test(value: T): Unit {}
}
