package test

import java.lang.*
import java.lang.Exception as JException

@java
external class InteropTest {
    public func test(num: Int32): Unit {}
}

@java
external class TestException1 <: Exception {
}

@java
external class TestException2 <: Exception {
}

@java
external class TestException3 <: Exception {
}
