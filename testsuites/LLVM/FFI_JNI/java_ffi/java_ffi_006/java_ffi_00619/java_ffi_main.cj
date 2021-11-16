// DEPENDENCE: InteropTest.cj InteropTest.java jlang.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan -12345
// ASSERT: scan-not Exception

import test.*
import java.lang.Integer

@java
interface A<T> <: InteropTest<T> {
    func get(value: T): T { return value }
}

@java
class Child<T> <: A<T> {}

func main() {
    var interoptest: Child<Integer> = Child<Integer>()
    interoptest.test(interoptest.get(Integer(-12345)))
    return 0
}
