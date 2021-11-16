// DEPENDENCE: InteropTest.cj
// EXEC:%compiler %cmp_opt %enable_macro InteropTest.cj %pic_opt
// EXEC:%compiler %cmp_opt define.o %f
// EXEC-PIPE:%run --boot-panda-files "%panda_lib:%cstring_bin" %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in cangjie\n
// ASSERT: scan-not Exception

import macro test.*

enum Test {
    A | B | C

    @InteropTest[name="cangjie", num=Int32(10)]
    func test():Unit {
        var num3: Int64 = 3;
        print("in cangjie\n")
    }
}

func main():Int64 {
    var t: Test = Test.A
    t.test()
    return 0
}
