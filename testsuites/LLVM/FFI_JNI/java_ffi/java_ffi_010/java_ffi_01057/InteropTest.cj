package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest {
    var t: JString
    public init(t: JString) { this.t = t }
}
