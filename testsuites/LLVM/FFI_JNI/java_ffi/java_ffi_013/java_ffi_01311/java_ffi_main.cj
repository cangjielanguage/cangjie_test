// DEPENDENCE: InteropTest.cj InteropTest.java TestException1.java TestException2.java TestException3.java
// EXEC:%javac InteropTest.java TestException1.java TestException2.java TestException3.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda TestException1.class TestException1.bin
// EXEC:%class2panda TestException2.class TestException2.bin
// EXEC:%class2panda TestException3.class TestException3.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan test.TestException1: throw in java
// ASSERT: scan test.TestException2: throw in java
// ASSERT: scan test.TestException3: throw in java

import test.*

func main() {
    let cls: InteropTest = InteropTest()
    try {
        cls.test(-1)
    } catch (e: TestException1) {
        e.printStackTrace()
    }
    try {
        cls.test(0)
    } catch (e: TestException2) {
        e.printStackTrace()
    }
    try {
        cls.test(1)
    } catch (e: TestException3) {
        e.printStackTrace()
        return 0
    }
    return 1
}
