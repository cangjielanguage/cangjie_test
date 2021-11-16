// DEPENDENCE: InteropTest.cj InteropTest.java Color.java
// EXEC:%javac InteropTest.java Color.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda Color.class Color.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan REDGREENBLUE
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

@java
class Child <: InteropTest {}

func main() {
    let cls: Child = Child()
    cls.test(JArray<Color>([Color.RED, Color.GREEN, Color.BLUE]))
    return 0
}
