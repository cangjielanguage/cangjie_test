// DEPENDENCE: InteropTest.cj InteropTest.java jlang.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan myList[0] = 1\nmyList[1] = 2\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

func main() {
    let cls: InteropTest<Integer> = InteropTest<Integer>()
    cls.array = JArray<Integer>([Integer(1), Integer(2)])
    var a: JArray<Integer> = cls.getArray()
    cls.test(a)
    return 0
}
