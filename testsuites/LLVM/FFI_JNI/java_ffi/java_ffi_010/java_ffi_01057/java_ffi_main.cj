// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan cls1\ncls2\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func main() {
    let cls1: InteropTest = InteropTest(J"cls1\n")
    let cls2: InteropTest = InteropTest(J"cls2\n")
    var a: JArray<InteropTest> = JArray<InteropTest>([cls1, cls2])
    print(toString(a[0].t))
    print(toString(a[1].t))
    return 0
}
