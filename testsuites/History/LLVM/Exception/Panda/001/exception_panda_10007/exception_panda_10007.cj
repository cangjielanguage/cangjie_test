// DEPENDENCE: ast-cfg InteropTest.cj InteropTest.java
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" > ast-base
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" >> ast-cfg
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c InteropTest.cj -i ast-base -o InteropTest.panda
// EXEC:%compiler %cmp_opt -i ast-cfg %f
// EXEC-PIPE:LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run --boot-panda-files "%panda_lib:%java_lib:InteropTest.bin" %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan java.lang.RuntimeException
// ASSERT: scan at test.InteropTest.exceptionInJava(InteropTest.java:5)


import test.*
import java.lang.Object

func main() {
    var i = InteropTest()
    var obj = java.lang.Object()
    try {
        i.exceptionInJava()
    } catch (e:RuntimeException){
        e.printStackTrace()
        return 0
    } catch (e:Exception){
        return 3
    }
    return 5
}
