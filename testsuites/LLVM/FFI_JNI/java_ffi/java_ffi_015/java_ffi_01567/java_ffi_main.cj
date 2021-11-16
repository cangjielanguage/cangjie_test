// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerInterface.class' 'InteropTest$InnerInterface.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan PASS\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*

@java
class A {}

@java
class B {}

@java
class Test <: InteropTest.InnerInterface<A, B> {}

func main(): Int64 {
    var test: Test = Test()
    var a: A = A()
    var b: B = B()
    if (test.defaultFunc1(a, b) && !test.defaultFunc2(a, b) && Test.staticFunc1(a, b) && InteropTest.InnerInterface<A, B>.staticFunc1(a, b)) {
        print("PASS\n")
        return 0
    }
    return 1
}
