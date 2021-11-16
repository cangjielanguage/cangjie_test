// DEPENDENCE: ast-cfg InteropTest.cj InteropTest.java
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" > ast-base
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" >> ast-cfg
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC:%compiler %cmp_opt -c InteropTest.cj -i ast-base -o InteropTest.panda
// EXEC:%compiler %cmp_opt -i ast-cfg %f
// EXEC-PIPE:LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run --boot-panda-files "%panda_lib:%java_lib:InteropTest.bin:A.bin" %panda_args %output %run_args | compare %f
// ASSERT: scan 123

import test.*
import java.lang.Object

func main() {
    var obj = java.lang.Object()
    try {
        InteropTest.exceptionInJava()
    } catch (e:Throwable){ // exception in java thread can not be catch here.
        e.printStackTrace()
        return 5
    }
    return 0
}
