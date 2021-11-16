// DEPENDENCE: test Main.java
// EXEC:%javac test/InteropTest.java
// EXEC:%javac Main.java
// EXEC:%class2panda test InteropTest.panda
// EXEC:%class2panda Main.class Main.panda
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run --boot-panda-files "%panda_lib:%cstring_bin:InteropTest.panda:java_ffi_main.panda" %panda_args Main.panda Main::main 2>&1 | compare %f
// ASSERT: scan char arg0\n@test.InteropTest(name=cangjie1, num=1)\n
// ASSERT: scan java.lang.String arg1\n@test.InteropTest(name=cangjie2, num=2)\n
// ASSERT: scan java.lang.Object arg2\n@test.InteropTest(name=cangjie3, num=3)\n
// ASSERT: scan-not Exception

import java.lang.*
from ffi import java.*

@java
class Test <: Enum<Test> {
    public static let RED: Test = Test(J"RED", 0)
    public static let GREEN: Test = Test(J"GREEN", 1)
    public static let BLUE: Test = Test(J"BLUE", 2)

    init(s: JString, i: Int32) { super(s, i) }

    @JFuncParam[test.InteropTest(name=J"cangjie1", num=Int32(1)), test.InteropTest(name=J"cangjie2", num=Int32(2)), test.InteropTest(name=J"cangjie3", num=Int32(3))]
    func test(n1: UInt16, n2: JString, n3: java.lang.Object):Unit {
        var num3: Int64 = Int64(n1);
    }
}
