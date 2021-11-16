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
// ASSERT: scan in cangjie\nin java\n

import test.*
import java.lang.*
from ffi import java.JString

func main() {
    var interoptest = InteropTest(J"in cangjie")
    interoptest.test(interoptest.getStr())
    return 0
}
