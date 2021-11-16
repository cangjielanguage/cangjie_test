// DEPENDENCE: InteropTest.cj InteropTest.java jlang.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
import java.lang.Integer

@java
class Child <: InteropTest {
    func get<T>(value: T): T { // EXPECTED: regex need 'override' modifier for function 'get'
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
