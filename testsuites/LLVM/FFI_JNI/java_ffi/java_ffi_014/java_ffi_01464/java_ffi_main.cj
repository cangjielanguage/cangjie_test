// DEPENDENCE: test Main.java
// EXEC:%javac test/InteropTest.java
// EXEC:%javac Main.java
// EXEC:%class2panda test InteropTest.panda
// EXEC:%class2panda Main.class Main.panda
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run --boot-panda-files "%panda_lib:%cstring_bin:InteropTest.panda:java_ffi_main.panda" %panda_args Main.panda Main::main 2>&1 | compare %f
// ASSERT: scan int arg0\n@test.InteropTest(name=cangjie, num=10)
// ASSERT: scan-not Exception

import java.lang.*

@java
class Test {
    public let num1: Int32 = 1;

    init() {
        var num2: Float32 = 2.0
    }

    @JFuncParam[test.InteropTest(name=J"cangjie", num=Int32(10))]
    public func test(n1: Int32):Unit {
        var num3: Int64 = Int64(n1);
        print("in cangjie\n")
    }
}
