// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

@java
class B <: A {
    func test(str: String): Unit { // EXPECTED: regex 'String' cannot be used as a function parameter type in java interoperation
        print(str)
    }
}

func main(): Int64 {
    let cls: InteropTest = InteropTest()
    cls.test(B())
    return 0
}
