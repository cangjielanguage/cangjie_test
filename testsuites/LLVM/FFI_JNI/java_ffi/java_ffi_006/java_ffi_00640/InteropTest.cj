package test

import java.lang.*
import java.lang.Comparable as JComparable

@java
external class InteropTest {
    func test<T>(value1: T, value2: T): Unit where T <: Number & JComparable<T> {}
}
