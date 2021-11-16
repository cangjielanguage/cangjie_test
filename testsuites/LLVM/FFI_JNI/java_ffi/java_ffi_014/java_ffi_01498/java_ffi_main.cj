// DEPENDENCE: test Main.java
// EXEC:%javac test/InteropTest.java
// EXEC:%javac Main.java
// EXEC:%class2panda test InteropTest.panda
// EXEC:%class2panda Main.class Main.panda
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run --boot-panda-files "%panda_lib:%cstring_bin:InteropTest.panda:java_ffi_main.panda" %panda_args Main.panda Main::main 2>&1 | compare %f
// ASSERT: scan char arg0\ncj1\ncj2\n1\n2\na\n4\n5\n
// ASSERT: scan java.lang.String arg1\nnull\n
// ASSERT: scan java.lang.Object arg2\nnull\n
// ASSERT: scan-not Exception

import java.lang.*
from ffi import java.*

@java
class Test {
    public let num1: Int32 = 1;

    init() {
        var num2: Float32 = 2.0
    }

    @JFuncParam[test.InteropTest(name1=J"cj1", name2=J"cj2", num1=Int8(1), num2=Int16(2), num3=UInt16(97), num4=Int32(4), num5=Int64(5)), null, null]
    public static func test(n1: UInt16, n2: JString, n3: java.lang.Object):Unit {
        var num3: Int64 = Int64(n1);
    }
}
