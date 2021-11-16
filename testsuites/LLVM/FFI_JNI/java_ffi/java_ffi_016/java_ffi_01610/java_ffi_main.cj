// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in cangjie\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

func test(inner: InteropTest.InnerClass): Int64 {
    if (inner.test() == 1111 && InteropTest.InnerClass.staticFunc() == 1010) {
        inner.show<JString>(J"in cangjie")
        return 0
    }
    return 1
}

func main(): Int64 {
    return test(InteropTest.InnerClass())
}
