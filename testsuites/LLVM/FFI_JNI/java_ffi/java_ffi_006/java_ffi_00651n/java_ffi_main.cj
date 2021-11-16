// DEPENDENCE: InteropTest.cj InteropTest.java Child.java
// EXEC:%javac InteropTest.java Child.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda Child.class Child.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
import java.lang.*

class Test {
    static func testfunc<T>(value: T) where T <: InteropTest { // EXPECTED: regex func 'testfunc' should have '@java' annotation
        print("num = " + value.num.toString() + "\n")
    }
}

func main() {
    var child: Child = Child()
    Test.testfunc<InteropTest>(child)
    return 0
}
