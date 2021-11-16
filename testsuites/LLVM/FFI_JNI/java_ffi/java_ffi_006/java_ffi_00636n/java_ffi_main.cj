// DEPENDENCE: InteropTest.cj InteropTest.java jlang.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
import java.lang.Integer

class Child <: InteropTest { // EXPECTED: regex Class 'Child' should have '@java' annotation
    override func get<T>(value: T): T {
        print("in cangjie\n")
        return value
    }
}

func main() {
    var interoptest: Child = Child()
    var num: Integer = interoptest.get<Integer>(Integer(-123))
    interoptest.test(num)
    return 0
}
