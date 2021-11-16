// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 2\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

class Test<T> where T <: InteropTest.InnerClass {
    var t: T
    init(t: T) {
        this.t = t
    }
}

func main(): Int64 {
    var test: Test<InteropTest.InnerClass> = Test<InteropTest.InnerClass>(InteropTest.InnerClass())
    var inner: InteropTest.InnerClass = test.t
    if (inner.test() == 1111 && InteropTest.InnerClass.staticFunc() == 1010) {
        inner.show<InteropTest.InnerClass>(JArray<InteropTest.InnerClass>([InteropTest.InnerClass(), InteropTest.InnerClass()]))
        return 0
    }
    return 1
}
