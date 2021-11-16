package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest<T> {
    var t: T
    public init(t: T) { this.t = t }
}
