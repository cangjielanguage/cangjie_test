// DEPENDENCE: InteropTest.cj InteropTest.java jlang.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
import java.lang.Integer

interface A<T> <: InteropTest<T> & InteropTest<Integer> {}

class Child<T> <: A<T> {}

func main() {
    var interoptest: Child<Integer> = Child<Integer>() // EXPECTED: regex class 'Child' inherits or implements duplicate interface 'InteropTest'
    interoptest.test(interoptest.get(Integer(-12345)))
    return 0
}
