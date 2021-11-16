// DEPENDENCE: InteropTest.cj test Main.java
// EXEC:%javac test/InteropTest.java
// EXEC:%javac Main.java
// EXEC:%class2panda test InteropTest.panda
// EXEC:%class2panda Main.class Main.panda
// EXEC:%compiler %cmp_opt %enable_macro InteropTest.cj %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC-PIPE:%run --boot-panda-files "%panda_lib:%cstring_bin:InteropTest.panda:java_ffi_main.panda" %panda_args Main.panda Main::main 2>&1 | compare %f
// ASSERT: scan @test.InteropTest(num=1)\n@test.InteropTest(num=2)\n@test.InteropTest(num=3)\n
// ASSERT: scan-not Exception

import macro test.*
import java.lang.*

@java
class Test {
    @InteropTest[num=Int16(1)]
    public let num1: Int32 = 1;

    @InteropTest[num=Int16(2)]
    init() {
        var num2: Float32 = 2.0
    }

    @InteropTest[num=Int16(3)]
    public func test():Unit {
        var num3: Int64 = 3;
        print("in cangjie\n")
    }
}
