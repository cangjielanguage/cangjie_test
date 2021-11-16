// DEPENDENCE: InteropTest.cj test Main.java
// EXEC:%javac test/InteropTest.java
// EXEC:%javac Main.java
// EXEC:%class2panda test InteropTest.panda
// EXEC:%class2panda Main.class Main.panda
// EXEC:%compiler %cmp_opt %enable_macro InteropTest.cj %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC-PIPE:%run --boot-panda-files "%panda_lib:%cstring_bin:InteropTest.panda:java_ffi_main.panda" %panda_args Main.panda Main::main 2>&1 | compare %f
// ASSERT: scan @test.InteropTest(name=cangjie, num=10)
// ASSERT: scan-not Exception

import macro test.*
import java.lang.*

@java
class Test {
    public let num1: Int32 = 1;

    @InteropTest[name=J"cangjie", num=Int32(10)]
    Test(n1: Int64, n2: Float32) {
        var num2: Float32 = Float32(n1) + n2
    }

    public func test():Unit {
        var num3: Int64 = 3;
        print("in cangjie\n")
    }
}
