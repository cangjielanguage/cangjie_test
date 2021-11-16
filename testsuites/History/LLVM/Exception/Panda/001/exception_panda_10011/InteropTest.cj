package test

import java.lang.Object


@java
external class InteropTest{
    static func exceptionInJava(): Unit { /* compiled code */ }
}

@java
external open class A{}
