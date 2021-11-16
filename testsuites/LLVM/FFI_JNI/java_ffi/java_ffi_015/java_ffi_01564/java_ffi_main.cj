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
// ASSERT: scan defaultShow\nstaticShow\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

@java
class A <: InteropTest.InnerInterface1 & InteropTest.InnerInterface2 & InteropTest.InnerInterface3 {
    func defaultShow<T>(t: T): Unit where T <: JString {
        print(toString(t))
    }

    static func staticShow<T>(t: T): Unit where T <: JString {
        print(toString(t))
    }
}

func main(): Int64 {
    var a: A = A()
    a.defaultShow(J"defaultShow\n")
    A.staticShow(J"staticShow\n")
    return 0
}
