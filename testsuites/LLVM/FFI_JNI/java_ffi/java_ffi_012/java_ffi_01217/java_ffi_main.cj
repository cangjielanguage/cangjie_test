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

@java
func test<T>(cls: T, str: String): Unit where T <: A {
    cls.test()
    print(str)
}

@java
class B <: A {}

func main(): Int64 {
    test<B>(B(), "in cangjie\n")
    return 0
}
