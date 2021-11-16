package test

import java.lang.*
import java.lang.Exception as JException

@java
external class InteropTest {
    public static func test(): Unit {}
}

@java
external class TestException <: Exception {
}
