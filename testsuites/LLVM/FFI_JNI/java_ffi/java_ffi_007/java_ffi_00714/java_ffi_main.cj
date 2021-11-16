// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:echo "test=./test.cjo" > ast-cfg
// EXEC:echo "java=%libdir/ffi/java.cjo" >> ast-cfg
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" >> ast-cfg
// EXEC:echo "java=%libdir/ffi/java.cjo" > ast-base
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" >> ast-base
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -i ast-base -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt -i ast-cfg %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in\n    java\n\nin\\n\n    cangjie\n\n

import test.*
import java.lang.*
from ffi import java.*

func main() {
    var interoptest: InteropTest = InteropTest()
    var s1 = """
in
    java
"""
    var s2 = ##"in\n
    cangjie
"##
    interoptest.test(toJString(s1))
    interoptest.test(toJString(s2))
    return 0
}
