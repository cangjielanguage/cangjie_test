// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 3.000003
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

func main() {
    var interoptest: InteropTest = InteropTest()
    var f: Float32 = interoptest.test(2.000002)
    if (f >= 3.000004 || f <= 3.000002) {
        return 1
    }
    print("3.000003")
    return 0
}
