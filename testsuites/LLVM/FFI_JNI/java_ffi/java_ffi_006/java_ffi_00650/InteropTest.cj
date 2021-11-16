package test

import java.lang.*

@java
external open class InteropTest {
    public var num: Int32 = 0
}

@java
external class Child <: InteropTest {
    public var num: Int32 = 0
}
