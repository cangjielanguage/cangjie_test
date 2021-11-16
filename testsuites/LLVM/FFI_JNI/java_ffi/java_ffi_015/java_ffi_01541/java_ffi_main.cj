// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan show: in cangjie\nPASS\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

func main(): Int64 {
    var inner: InteropTest.InnerClass = InteropTest.InnerClass()
    if (inner.test() == 2 && InteropTest.InnerClass.staticFunc() == 11) {
        inner.show<JString>(J"in cangjie")
        print("PASS\n")
        return 0
    }
    return 1
}
