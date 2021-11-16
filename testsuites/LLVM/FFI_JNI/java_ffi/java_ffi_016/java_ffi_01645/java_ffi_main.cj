// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan override\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

@java
class A <: InteropTest.InnerClass {
    override func test(): Int32 {
        return num + staticNum
    }

    redef static func staticFunc(): Int32 {
        return staticNum
    }

    redef static func show<T>(t: T): Unit {
        print("override\n")
    }
}

func main(): Int64 {
    var a: A = A()
    if (a.test() == 11 && A.staticFunc() == 10) {
        A.show<JString>(J"in cangjie")
        return 0
    }
    return 1
}
