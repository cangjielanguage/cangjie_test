package test

import java.lang.Object

@java
external class InteropTest <: java.lang.Object {
    static func exceptionInJava(): Unit { /* compiled code */ }
}
@java
external open class A <: RuntimeException{}

@java
external class B <: Exception{}