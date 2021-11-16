// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 123
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

@java
class Child <: InteropTest {
    func test1(num1: Int32, num2: Int32, array: JArray<Int32>): Unit {
        test2(num1, num2, array)
    }
}

func main() {
    let cls: Child = Child()
    cls.test1(1, 2, JArray<Int32>([1, 2, 3]))
    return 0
}
