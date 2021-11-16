package test

import java.lang.*
import java.lang.Throwable as T

@java
external class InteropTest{
    static func exceptionInJava(): Unit { /* compiled code */ }
}

@java
external class A{}