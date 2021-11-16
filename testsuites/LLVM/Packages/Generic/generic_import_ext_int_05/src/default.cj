// DEPENDENCE: p1/InteropTest.java p2/InteropTest.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt  -c InteropTest.cj -o InteropTest.%middle
// EXEC: %compiler %cmp_opt InteropTest.%middle %f -o %output
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan-not Exception

//dts:DTS2021082513793
import p2.A
import java.lang.*
import ffi.java.*

func main(): Int64 {
    var a: A<JString> = A<JString>(J"abc")
    return 0
}
