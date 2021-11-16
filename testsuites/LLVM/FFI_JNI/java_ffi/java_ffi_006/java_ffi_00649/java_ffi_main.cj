// DEPENDENCE: InteropTest.cj InteropTest.java Child.java
// EXEC:%javac InteropTest.java Child.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda Child.class Child.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan num = 1\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*

@java
class Test {
    func testfunc<T>(value: T) where T <: InteropTest {
        print("num = " + value.num.toString() + "\n")
    }
}

func main() {
    var test: Test = Test()
    var child: Child = Child()
    test.testfunc<InteropTest>(child)
    return 0
}
