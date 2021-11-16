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
// ASSERT: scan PASS\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*

@java
class A <: InteropTest.InnerInterface1 & InteropTest.InnerInterface2 & InteropTest.InnerInterface3 {
    func defaultFunc(): Int32 {
        return InteropTest.num1 + 1
    }

    static func staticFunc(): Int32 {
        return InteropTest.num1 + 2
    }
}

func main(): Int64 {
    var a: A = A()
    if (a.defaultFunc() == 2 && A.staticFunc() == 3) {
        print("PASS\n")
        return 0
    }
    return 1
}
