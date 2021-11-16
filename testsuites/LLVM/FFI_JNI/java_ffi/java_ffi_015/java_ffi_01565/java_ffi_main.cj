// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerInterface1.class' 'InteropTest$InnerInterface1.panda'
// EXEC:%class2panda 'InteropTest$InnerInterface2.class' 'InteropTest$InnerInterface2.panda'
// EXEC:%class2panda 'InteropTest$InnerInterface3.class' 'InteropTest$InnerInterface3.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*
from ffi import java.*

@java
class A1 {}

@java
class A2 {}

@java
class A3 {}

@java
class A <: InteropTest.InnerInterface1<A1> & InteropTest.InnerInterface2<A2> & InteropTest.InnerInterface3<A3> {} // EXPECTED: regex 'defaultShow' in 'InteropTest.InnerInterface1' and 'defaultShow' in 'InteropTest.InnerInterface2' have the same erasure

func main(): Int64 {
    var a: A = A()
    var a1: A1 = A1()
    var a2: A2 = A2()
    var a3: A3 = A3()
    a.defaultShow(a1)
    A.staticShow(a1)
    a.defaultShow(a2)
    A.staticShow(a2)
    a.defaultShow(a3)
    A.staticShow(a3)
    return 0
}
