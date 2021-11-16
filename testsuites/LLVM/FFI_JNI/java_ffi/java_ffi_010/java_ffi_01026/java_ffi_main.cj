// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 300\n300\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func main() {
    let cls: InteropTest = InteropTest()
    var a: List<A> = [A(100), A(200)]
    cls.test(a.ToJArray())
    cls.test(JArray<A>(a))
    return 0
}
