// DEPENDENCE: test Main.java
// EXEC:%javac test/InteropTest.java
// EXEC:%javac Main.java
// EXEC:%class2panda test InteropTest.panda
// EXEC:%class2panda Main.class Main.panda
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

import java.lang.*
from ffi import java.*

@java
class Test {
    public let num1: Int32 = 1;

    init() {
        var num2: Float32 = 2.0
    }

    @JFuncParam[test.InteropTest(name="cj1"), test.InteropTest(name="cj2"), test.InteropTest(name="cj3")] // EXPECTED: regex xxxxx
    public static func test(n1: UInt16, n2: JString, n3: java.lang.Object):Unit {
        var num3: Int64 = Int64(n1);
    }
}
