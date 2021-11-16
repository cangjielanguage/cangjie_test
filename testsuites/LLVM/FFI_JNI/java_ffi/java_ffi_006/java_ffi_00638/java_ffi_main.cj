// DEPENDENCE: InteropTest.cj InteropTest.java jlang.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in cangjie\n
// ASSERT: scan-not Exception

import test.*
import java.lang.Integer

@java
class Child <: InteropTest {
    func test<T>(value: T): Unit {
        print("in cangjie\n")
    }
}

func main() {
    var interoptest: Child = Child()
    interoptest.test(Integer(-123))
    return 0
}
