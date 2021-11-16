// DEPENDENCE: InteropTest.cj InteropTest.java Color.java
// EXEC:%javac InteropTest.java Color.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda Color.class Color.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan RED\nRED\n0\nfalse\n-1\nGREEN\nGREEN\n1\ntrue\n0\nBLUE\nBLUE\n2\nfalse\n1\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func main() {
    var cls: InteropTest = InteropTest()
    cls.test(Color.RED)
    cls.test(Color.GREEN)
    cls.test(Color.BLUE)
    return 0
}
