// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in cangjie\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

@ java
open class C {
    func test1(): Unit {
        print("in cangjie\n")
    }
}

@java
class B <: C & A {
    func test(): Unit {
        test1()
    }
}

func main() {
    let cls: InteropTest = InteropTest()
    cls.test(B())
    return 0
}
