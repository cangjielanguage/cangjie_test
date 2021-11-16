// DEPENDENCE: InteropTest.cj test
// EXEC:%javac test/InteropTest.java
// EXEC:%class2panda test InteropTest.panda
// EXEC:%compiler %cmp_opt %enable_macro InteropTest.cj %pic_opt
// EXEC-PIPE-1: %compiler %cmp_opt InteropTest.o %f 2>&1 | compare %f

import macro test.*
import java.lang.*

@java
class Test {
    @InteropTest[name=true] // EXPECTED: regex xxxxx
    public let num1: Int32 = 1;

    @InteropTest[name=false] // EXPECTED: regex xxxxx
    init() {
        var num2: Float32 = 2.0
    }

    @InteropTest[name=true] // EXPECTED: regex xxxxx
    public func test():Unit {
        var num3: Int64 = 3;
        print("in cangjie\n")
    }
}
