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
// ASSERT: scan in javain cangjie\n

import test.*
import java.lang.*
from ffi import java.*

@java
class A <: InteropTest {
    var str: JString = J"in cangjie"

    override func getStr(): JString { return str }
}

func main() {
    var interoptest: InteropTest = InteropTest()
    var a: A = A()
    var str: JString = interoptest.getStr()
    a.str = str + a.str
    interoptest.test(a)
    return 0
}
