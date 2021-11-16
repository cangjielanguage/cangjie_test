// DEPENDENCE: ast-cfg InteropTest.cj InteropTest.java
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" > ast-base
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" >> ast-cfg
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c InteropTest.cj -i ast-base -o InteropTest.panda
// EXEC:%compiler %cmp_opt -i ast-cfg %f
// EXEC-PIPE:LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run --boot-panda-files "%panda_lib:%java_lib:InteropTest.bin" %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan catch_in_cangjie!


import test.*
import java.lang.Object
import java.lang.NullPointerException as N

func main() {
    try {
        InteropTest.exceptionInJava()
    } catch (e:N){
        print("catch_in_cangjie!")
        return 0
    }
    return 5
}
