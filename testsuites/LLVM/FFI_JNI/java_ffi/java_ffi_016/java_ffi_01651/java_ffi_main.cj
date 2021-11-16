// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%class2panda 'InteropTest$InnerClass$innerClass.class' 'InteropTest$InnerClass$innerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in cangjie\nin inner2\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

func main(): Int64 {
    var inner: InteropTest.InnerClass = InteropTest.InnerClass()
    var inner2: InteropTest.InnerClass.innerClass = InteropTest.InnerClass.innerClass()
    if (inner.test() == 1111 && InteropTest.InnerClass.staticFunc() == 1010) {
        inner.show<JString>(J"in cangjie")
        inner2.show<JString>(J"in inner2")
        return 0
    }
    return 1
}
