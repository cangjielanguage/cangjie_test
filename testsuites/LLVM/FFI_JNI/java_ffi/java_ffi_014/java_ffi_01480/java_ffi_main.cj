// DEPENDENCE: test Main.java
// EXEC:%javac test/InteropTest.java
// EXEC:%javac Main.java
// EXEC:%class2panda test InteropTest.panda
// EXEC:%class2panda Main.class Main.panda
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run --boot-panda-files "%panda_lib:%cstring_bin:InteropTest.panda:java_ffi_main.panda" %panda_args Main.panda Main::main 2>&1 | compare %f
// ASSERT: scan Test: char arg0\n@test.InteropTest(name=cangjie1, num=1)\n
// ASSERT: scan Test: java.lang.String arg1\n@test.InteropTest(name=cangjie2, num=2)\n
// ASSERT: scan Test: java.lang.Object arg2\n@test.InteropTest(name=cangjie3, num=3)\n
// ASSERT: scan Child: char arg0\nnull\n
// ASSERT: scan Child: java.lang.String arg1\nnull\n
// ASSERT: scan Child: java.lang.Object arg2\nnull\n
// ASSERT: scan-not Exception

import java.lang.*
from ffi import java.*

@java
open class Test {
    public let num1: Int32 = 1;

    init() {
        var num2: Float32 = 2.0
    }

    @JFuncParam[test.InteropTest(name=J"cangjie1", num=Int32(1)), test.InteropTest(name=J"cangjie2", num=Int32(2)), test.InteropTest(name=J"cangjie3", num=Int32(3))]
    public static func test(n1: UInt16, n2: JString, n3: java.lang.Object):Unit {
        var num3: Int64 = Int64(n1);
    }
}

@java
class Child <: Test {
    redef public static func test(n1: UInt16, n2: JString, n3: java.lang.Object):Unit {}
}
