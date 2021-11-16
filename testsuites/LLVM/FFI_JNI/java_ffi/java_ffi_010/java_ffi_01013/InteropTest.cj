package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    public var myList: JArray<A>
}

@java
external class A {
    var num: Int32 = 0
    init(num: Int32) {}
}
