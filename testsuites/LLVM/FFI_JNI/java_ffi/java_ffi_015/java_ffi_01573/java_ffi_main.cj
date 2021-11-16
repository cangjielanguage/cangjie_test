// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan defaultShow\nstaticShow\ndefaultShow1\nstaticShow1\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

@java
class A <: InteropTest.InnerClass {
    func defaultShow<T>(t: T): Unit where T <: JString {
        print(toString(t))
    }

    static func staticShow<T>(t: T): Unit where T <: JString {
        print(toString(t))
    }
}

func main(): Int64 {
    var a: A = A()
    if (a.defaultFunc1() == 11 && A.staticFunc1() == 12) {
        a.defaultShow(J"defaultShow\n")
        A.staticShow(J"staticShow\n")
        a.defaultShow1(J"defaultShow1")
        A.staticShow1(J"staticShow1")
        return 0
    }
    return 1
}
