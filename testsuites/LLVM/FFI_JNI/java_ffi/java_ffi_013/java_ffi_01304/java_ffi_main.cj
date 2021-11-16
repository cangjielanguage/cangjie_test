// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan java.lang.RuntimeException: throw in java

import test.*

func main() {
    let cls: InteropTest = InteropTest()
    try {
        InteropTest.test()
    } catch (e: RuntimeException) {
        e.printStackTrace()
        return 0
    }
    return 1
}
