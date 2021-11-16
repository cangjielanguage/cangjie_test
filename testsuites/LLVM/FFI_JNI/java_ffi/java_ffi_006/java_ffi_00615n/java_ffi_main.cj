// DEPENDENCE: InteropTest.cj InteropTest.java jlang.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
import java.lang.Integer

interface A<T> {
    func get(value: T): T {
        print("in A\n")
        return value
    }
}

@java
class Child<T> <: InteropTest<T> & A<T> { // EXPECTED: regex function 'get' needs to be overridden
}

func main() {
    var interoptest: Child<Integer> = Child<Integer>()
    interoptest.test(interoptest.get(Integer(-12345)))
    return 0
}
