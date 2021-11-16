// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerInterface.class' 'InteropTest$InnerInterface.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan PASS\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*

@java
interface A <: InteropTest.InnerInterface {
    func test(): Int32 {
        return InteropTest.InnerInterface.num2
    }

    func defaultFunc(): Int32 {
        return InteropTest.InnerInterface.num2 + 10;
    }

    static func staticFunc(): Int32 {
        return InteropTest.InnerInterface.num2 + 20;
    }
}

@java
class B <: A {}

func main(): Int64 {
    var inner: B = B()
    if (inner.test() == 1 && inner.defaultFunc() == 11 && B.staticFunc() == 21) {
        print("PASS\n")
        return 0
    }
    return 1
}
