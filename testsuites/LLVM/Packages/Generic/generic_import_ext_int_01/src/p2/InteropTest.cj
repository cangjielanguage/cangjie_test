package p2

import p1.InteropTest
import java.lang.*
import ffi.java.*

@java
external class A<T> <: InteropTest.InnerClass<T> {
    var a:T;
    init(x:T){
        super(x)
        a = x
    }
    override func show<T>(t: T): Unit {
        print("override\n")
    }
}