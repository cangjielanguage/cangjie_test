// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan java.lang.NullPointerException

import test.*
import java.lang.*
from ffi import java.*

func main() {
    let cls: InteropTest = InteropTest()
    try {
        cls.test(cls.cls)
    } catch (e: java.lang.NullPointerException) {
        print(toString(e.toString()))
        return 0
    }
    return 1
}
