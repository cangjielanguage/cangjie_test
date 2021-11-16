// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 1212
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

@java
class Child <: InteropTest {}

func main() {
    let cls: Child = Child()
    cls.test(JArray<JArray<Int64>>([[1, 2].ToJArray(), [1, 2].ToJArray()]]))
    return 0
}
