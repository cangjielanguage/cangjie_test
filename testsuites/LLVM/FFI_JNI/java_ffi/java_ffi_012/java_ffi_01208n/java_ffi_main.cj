// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

open class C { // EXPECTED: regex Class 'C' should have '@java' annotation
    func test1(): Unit {
        print("in cangjie\n")
    }
}

@java
class B <: C & A  {
    func test(): Unit {
        test1()
    }
}

func main() {
    let cls: InteropTest = InteropTest()
    cls.test(B())
    return 0
}
