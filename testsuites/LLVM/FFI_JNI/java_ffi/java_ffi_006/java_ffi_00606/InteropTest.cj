package test

import java.lang.*
import java.lang.Comparable as JComparable

@java
external class InteropTest<T> where T <: JComparable<T> {
    func test(value1: T, value2: T): Unit {}
}
