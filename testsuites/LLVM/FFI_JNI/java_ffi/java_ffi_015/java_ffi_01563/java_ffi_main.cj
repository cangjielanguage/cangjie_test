// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerInterface1.class' 'InteropTest$InnerInterface1.panda'
// EXEC:%class2panda 'InteropTest$InnerInterface2.class' 'InteropTest$InnerInterface2.panda'
// EXEC:%class2panda 'InteropTest$InnerInterface3.class' 'InteropTest$InnerInterface3.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan defaultShow1\nstaticShow1\ndefaultShow2\nstaticShow2\ndefaultShow3\nstaticShow3\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

@java
class A <: InteropTest.InnerInterface1 & InteropTest.InnerInterface2 & InteropTest.InnerInterface3 {}

func main(): Int64 {
    var a: A = A()
    if (a.defaultFunc1() != 11 || A.staticFunc1() != 12) {
        return 1
    }
    a.defaultShow1(J"defaultShow1")
    A.staticShow1(J"staticShow1")

    if (a.defaultFunc2() != 101 || A.staticFunc2() != 102) {
        return 2
    }
    a.defaultShow2(J"defaultShow2")
    A.staticShow2(J"staticShow2")

    if (a.defaultFunc3() != 1001 || A.staticFunc3() != 1002) {
        return 3
    }
    a.defaultShow3(J"defaultShow3")
    A.staticShow3(J"staticShow3")
    return 0
}
