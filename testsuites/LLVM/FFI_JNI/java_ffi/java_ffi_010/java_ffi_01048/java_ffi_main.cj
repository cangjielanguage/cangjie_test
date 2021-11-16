// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: idx = -1; length = 5

import test.*
from ffi import java.*

func main() {
    let cls: InteropTest = InteropTest()
    if (cls.myList[-1] == 1) {
        print("OK\n")
    }
    cls.test(cls.myList)
    return 0
}
