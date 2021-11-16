// DEPENDENCE: ast-cfg InteropTest.cj InteropTest.java
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" > ast-base
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" >> ast-cfg
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c InteropTest.cj -i ast-base -o InteropTest.panda
// EXEC:%compiler %cmp_opt -i ast-cfg %f
// EXEC-PIPE-1:LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run --boot-panda-files "%panda_lib:%java_lib:InteropTest.bin" %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception in thread "main" java.lang.RuntimeException: throw_in_java


import test.*
import java.lang.Object

func main() {
    try {
        InteropTest.exceptionInJava()
    } catch (e:Error){ // Error can not catch RuntimeException
        print("Error can not catch RuntimeException!")
        return 5
    }
    return 0
}
