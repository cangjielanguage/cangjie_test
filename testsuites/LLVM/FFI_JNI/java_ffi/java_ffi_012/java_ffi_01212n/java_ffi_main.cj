// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

interface C {
    func test1(): Unit {
        print("in cangjie\n")
    }
}

@java
class B <: A & C {

    func test(): Unit {
        test1()
    }
}

func main(): Int64 {
    @java
    func test(): Unit { // EXPECTED: regex func 'test' should not have '@java' annotation
        print("in java\n")
    }
    let cls: InteropTest = InteropTest()
    cls.test(B())
    return 0
}
