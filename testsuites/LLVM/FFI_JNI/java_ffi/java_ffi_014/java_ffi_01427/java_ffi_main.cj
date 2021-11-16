// DEPENDENCE: InteropTest.cj test Main.java
// EXEC:%javac test/InteropTest.java
// EXEC:%javac Main.java
// EXEC:%class2panda test InteropTest.panda
// EXEC:%class2panda Main.class Main.panda
// EXEC:%compiler %cmp_opt %enable_macro InteropTest.cj %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC-PIPE:%run --boot-panda-files "%panda_lib:%cstring_bin:InteropTest.panda:java_ffi_main.panda" %panda_args Main.panda Main::main 2>&1 | compare %f
// ASSERT: scan field1: @test.InteropTest(name=cangjie, num=10)\n
// ASSERT: scan field2: @test.InteropTest(name=cangjie, num=11)\n
// ASSERT: scan field3: @test.InteropTest(name=cangjie, num=12)\n
// ASSERT: scan init: @test.InteropTest(name=cangjie, num=13)\n
// ASSERT: scan method: @test.InteropTest(name=cangjie, num=14)\n
// ASSERT: scan-not Exception

import macro test.*
import java.lang.*
from ffi import java.*

@java
class Test <: Enum<Test> {
    @InteropTest[name=J"cangjie", num=Int32(10)]
    public static let RED: Test = Test(J"RED", 0)
    @InteropTest[name=J"cangjie", num=Int32(11)]
    public static let GREEN: Test = Test(J"GREEN", 1)
    @InteropTest[name=J"cangjie", num=Int32(12)]
    public static let BLUE: Test = Test(J"BLUE", 2)

    @InteropTest[name=J"cangjie", num=Int32(13)]
    init(s: JString, i: Int32) { super(s, i) }

    @InteropTest[name=J"cangjie", num=Int32(14)]
    func test():Unit {
        var num3: Int64 = 3;
        print("in cangjie\n")
    }
}
