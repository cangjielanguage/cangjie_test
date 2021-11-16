// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan PASS\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

@java
class A <: InteropTest.InnerClass {
    func test(): Int32 {
        return num2
    }
}

class Test<T> where T <: InteropTest.InnerClass {
    var t: T
    init(t: T) {
        this.t = t
    }
}

func main(): Int64 {
    var test: Test<InteropTest.InnerClass> = Test<InteropTest.InnerClass>(A())
    if (test.t.test() == 1 && test.t.defaultFunc() == 2) {
        print("PASS\n")
        return 0
    }
    return 1
}
