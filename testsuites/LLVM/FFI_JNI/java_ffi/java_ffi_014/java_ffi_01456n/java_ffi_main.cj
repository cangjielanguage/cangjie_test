// DEPENDENCE: InteropTest.cj test
// EXEC:%javac test/InteropTest.java
// EXEC:%class2panda test InteropTest.panda
// EXEC:%compiler %cmp_opt %enable_macro InteropTest.cj %pic_opt
// EXEC-PIPE-1: %compiler %cmp_opt InteropTest.o %f 2>&1 | compare %f

import macro test.*
import java.lang.*

@java
class Test {
    @InteropTest[name="cangjie1", num=Int32(10)] // EXPECTED: regex xxxx
    public let num1: Int32 = 1;

    @InteropTest[name="cangjie2", num=Int32(11)] // EXPECTED: regex xxxx
    init() {
        var num2: Float32 = 2.0
    }

    @InteropTest[name="cangjie3", num=Int32(12)] // EXPECTED: regex xxxx
    public func test():Unit {
        var num3: Int64 = 3;
        print("in cangjie\n")
    }
}
