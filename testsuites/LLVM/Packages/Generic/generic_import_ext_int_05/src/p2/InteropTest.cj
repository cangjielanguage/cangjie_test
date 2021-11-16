package p2

//import p1.*
import p1.InteropTest
import p1.InteropTest.InnerClass
import java.lang.*
import ffi.java.*

@java
external class A<T>  {
    var a : T
    init(x:T){ a = x }
    func foo(){
        return InteropTest.InnerClass<T>(a).num
    }
}