// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerInterface.class' 'InteropTest$InnerInterface.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 2\n2\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

@java
class A <: InteropTest.InnerInterface {}

func main(): Int64 {
    var a: A = A()
    a.show1<JString>(JArray<JString>([J"cang", J"jie"]))
    InteropTest.InnerInterface.show2<InteropTest.InnerInterface>(JArray<InteropTest.InnerInterface>([A(), A()]))
    return 0
}
