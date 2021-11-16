// DEPENDENCE: ast-cfg InteropTest.cj InteropTest.java
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" > ast-base
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" >> ast-cfg
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC:%class2panda B.class B.bin
// EXEC:%compiler %cmp_opt -c InteropTest.cj -i ast-base -o InteropTest.panda
// EXEC:%compiler %cmp_opt -i ast-cfg %f
// EXEC-PIPE:LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run --boot-panda-files "%panda_lib:%java_lib:InteropTest.bin:A.bin:B.bin" %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan finally_in_java!
// ASSERT: scan test.A
// ASSERT: scan at test.InteropTest.exceptionInJava(InteropTest.java:12)

import test.*
import java.lang.Object

func main() {
    try {
        InteropTest.exceptionInJava()
    } catch (e:A){ // exception A in java should be catch here.
        e.printStackTrace()
        return 0
    }
    return 3
}
