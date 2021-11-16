package p2

import p1.InteropTest
import java.lang.*
import ffi.java.*

@java
external class A<T> <: InteropTest.InnerClass {
    override func test(): Int32 {
        return num + staticNum
    }

    redef static func staticFunc(): Int32 {
        return staticNum
    }

    override func show<T>(t: T): Unit {
        print("override\n")
    }
}