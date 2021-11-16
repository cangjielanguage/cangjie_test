package test

import java.lang.*
from ffi import java.*

@java
external class InteropTest<T> {
    public func test(array: JArray<T>): JArray<T> { return array }
}
