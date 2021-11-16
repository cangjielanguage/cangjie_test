// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 2\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

@java
class A {}

func main() {
    let cls: InteropTest = InteropTest()
    cls.test(JArray<A>([A(), A()]))
    return 0
}
