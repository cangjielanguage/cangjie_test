// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerInterface.class' 'InteropTest$InnerInterface.panda'
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan PASS\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*

@java
class A <: InteropTest {
    func test(): InteropTest.InnerInterface {
        return InteropTest.cls
    }
}


func main(): Int64 {
    var a: A = A()
    var inner: InteropTest.InnerInterface = a.test()
    if (inner.test() == 4 && inner.defaultFunc() == 2 && InteropTest.InnerInterface.staticFunc() == 3) {
        print("PASS\n")
        return 0
    }
    return 1
}
