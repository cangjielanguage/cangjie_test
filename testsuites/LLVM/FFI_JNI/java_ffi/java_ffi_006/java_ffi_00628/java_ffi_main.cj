// DEPENDENCE: InteropTest.cj InteropTest.java jlang.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan -12345123-128
// ASSERT: scan-not Exception

import test.*
import java.lang.*

@java
class Child<T, K, V> <: InteropTest<T, K, V> {}

func main() {
    var interoptest: Child<Integer, Short, Byte> = Child<Integer, Short, Byte>()
    interoptest.test(Integer(-12345), Short(123), Byte(-128))
    return 0
}
