// DEPENDENCE: InteropTest.cj InteropTest.java TestException.java
// EXEC:%javac InteropTest.java TestException.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda TestException.class TestException.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan test.TestException: throw in java

import test.*

func main() {
    try {
        InteropTest.test()
    } catch (e: Exception) {
        e.printStackTrace()
        return 0
    }
    return 1
}
