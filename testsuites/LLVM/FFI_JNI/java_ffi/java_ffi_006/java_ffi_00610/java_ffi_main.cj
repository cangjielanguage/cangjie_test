// DEPENDENCE: InteropTest.cj InteropTest.java Test.java jlang.cj
// EXEC:%javac InteropTest.java Test.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda Test.class Test.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan -12345

import test.*
import java.lang.*
import java.lang.Integer

func main() {
    var interoptest: InteropTest<java.lang.Object> = InteropTest<java.lang.Object>()
    var c: Test = Test(interoptest)
    c.interoptest.test(Integer(-12345))
    return 0
}
