// DEPENDENCE: InteropTest.cj InteropTest.java jlang.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 12345
// ASSERT: scan-not Exception

import test.*
import java.lang.*
import java.lang.Comparable as JComparable

func main() {
    var interoptest: InteropTest = InteropTest()
    interoptest.test<Integer>(Integer(-12345), Integer(12345))
    return 0
}
