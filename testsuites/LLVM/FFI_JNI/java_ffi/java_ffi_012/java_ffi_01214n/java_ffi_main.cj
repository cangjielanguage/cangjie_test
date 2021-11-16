// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func test<T>(cls: T): Unit where T <: A { // EXPECTED: regex func 'test' should have '@java' annotation
    cls.test()
}

@java
class B <: A {}

func main(): Int64 {
    test<B>(B())
    return 0
}
