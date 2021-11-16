package test

import java.lang.*
import java.lang.Comparable as JComparable

@java
external interface InteropTest<T> where T <: Number & JComparable<T> {
    func test(value1: T, value2: T): Unit {}
}
