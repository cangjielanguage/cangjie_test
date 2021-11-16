// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan OK\nmyList[0] = true\nmyList[1] = false\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func main() {
    let cls: InteropTest = InteropTest()
    if (cls.myList[0] && !cls.myList[1]) {
        print("OK\n")
        print("myList[0] = " + cls.myList[0].toString() + "\n")
        print("myList[1] = " + cls.myList[1].toString() + "\n")
    }
    return 0
}
