// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in java\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

class C<T> where T <: A {
    func test(cls: T): Unit {
        cls.test()
    }
}

@java
class B <: A {}

func main(): Int64 {
    let cls: C<B> = C<B>()
    cls.test(B())
    return 0
}
