// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan test\nstaticTest\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

func main() {
    var test: InteropTest<JString> = InteropTest<JString>()
    if (test.num == 1 && InteropTest<JString>.staticNum == 2) {
        test.test(J"test")
        InteropTest<JString>.staticTest<JString>(J"staticTest")
        return 0
    }
    return 1
}
