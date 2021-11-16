package p2

import p1.InteropTest
import java.lang.*
import ffi.java.*

@java
external class A<T> {
    func foo(): Int32 {
        var a = InteropTest.InnerClass()
        return a.num
    }

}