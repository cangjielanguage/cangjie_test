// DEPENDENCE: InteropTest.java InteropTest1.java InteropTest2.java
// EXEC:%javac InteropTest.java InteropTest1.java InteropTest2.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda InteropTest1.class InteropTest1.panda
// EXEC:%class2panda InteropTest2.class InteropTest2.panda
// EXEC:%jar -cvf InteropTest.jar InteropTest.class InteropTest1.class InteropTest2.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan PASS\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*

@java
class A <: InteropTest & InteropTest1 & InteropTest2 {
    func test1(): Int32 {
        return InteropTest.num + InteropTest1.num1 + InteropTest2.num2
    }

    static func test2(): Int32 {
        return InteropTest.num + InteropTest1.num1 + InteropTest2.num2
    }
}

func main(): Int64 {
    var a: A = A()
    if (a.test1() == 3 && A.test2() == 3) {
        print("PASS\n")
        return 0
    }
    return 1
}
