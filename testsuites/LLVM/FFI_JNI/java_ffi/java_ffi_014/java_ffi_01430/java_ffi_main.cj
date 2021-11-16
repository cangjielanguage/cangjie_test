// DEPENDENCE: InteropTest.cj test Main.java
// EXEC:%javac test/InteropTest.java
// EXEC:%javac Main.java
// EXEC:%class2panda test InteropTest.panda
// EXEC:%class2panda Main.class Main.panda
// EXEC:%compiler %cmp_opt %enable_macro InteropTest.cj %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC-PIPE:%run --boot-panda-files "%panda_lib:%cstring_bin:InteropTest.panda:java_ffi_main.panda" %panda_args Main.panda Main::main 2>&1 | compare %f
// ASSERT: scan @test.InteropTest(name=cangjie1, num=10)\n@test.InteropTest(name=cangjie2, num=11)\n@test.InteropTest(name=cangjie3, num=12)\n@test.InteropTest(name=cangjie4, num=13)\n@test.InteropTest(name=cangjie5, num=14)\n@test.InteropTest(name=cangjie6, num=15)\n
// ASSERT: scan-not Exception

import macro test.*
import java.lang.*
from ffi import java.*

@java
class Test {
    @InteropTest[name=J"cangjie1", num=Int32(10)]
    public let num1: Int32 = 1;

    @InteropTest[name=J"cangjie2", num=Int32(11)]
    init() {
        var num2: Float32 = 2.0
    }

    @InteropTest[name=J"cangjie3", num=Int32(12)]
    public func test():Unit {
        var num3: Int64 = 3;
        print("in cangjie\n")
    }

    @InteropTest[name=J"cangjie4", num=Int32(13)]
    init(num: Int32) {
        var num2: Float32 = 2.0
    }

    @InteropTest[name=J"cangjie5", num=Int32(14)]
    public func test(str: JString):Unit {
        var num3: Int64 = 3;
        print("in cangjie\n")
    }

    @InteropTest[name=J"cangjie6", num=Int32(15)]
    public static func test1(str: JString):Unit {
        var num3: Int64 = 3;
        print("in cangjie\n")
    }
}
