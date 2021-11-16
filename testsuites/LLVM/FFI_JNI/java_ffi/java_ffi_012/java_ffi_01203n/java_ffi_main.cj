// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

interface B <: A {} // EXPECTED: regex Interface 'B' should have '@java' annotation

class C <: B {}

func main() {
    let cls: InteropTest = InteropTest()
    cls.test(C())
    return 0
}
