package test

import java.lang.*

@java
external open class InteropTest <: java.lang.Object {
    open func test(input: Parent): Unit {}
}

@java
external open class Parent <: java.lang.Object {
    open func test(): Unit {}
}
