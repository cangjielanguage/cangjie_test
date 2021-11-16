// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerInterface.class' 'InteropTest$InnerInterface.panda'
// EXEC:%class2panda 'InteropTest$InnerInterface$innerInterface.class' 'InteropTest$InnerInterface$innerInterface.panda'
// EXEC:%class2panda 'InteropTest$InnerInterface$innerClass.class' 'InteropTest$InnerInterface$innerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan PASS\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*

@java
class A <: InteropTest.InnerInterface {
    func test(): Int32 {
        return InteropTest.InnerInterface.num2
    }

    static func staticFunc(): Int32 {
        return InteropTest.InnerInterface.num2 + 20
    }

    func testInnerInterface(): Int64 {
        var cls: InteropTest.InnerInterface.innerInterface = InteropTest.InnerInterface.innerClass()
        if (cls.test() == 21 && cls.defaultFunc() == 11 && InteropTest.InnerInterface.innerInterface.staticFunc() == 12) {
            return 0
        }
        return 1
    }

    func testInnerClass(): Int64 {
        var cls: InteropTest.InnerInterface.innerClass = InteropTest.InnerInterface.innerClass()
        if (cls.test() == 21 && cls.defaultFunc() == 11 && InteropTest.InnerInterface.innerClass.staticFunc() == 30) {
            return 0
        }
        return 1
    }
}

func main(): Int64 {
    var a: A = A()
    if (a.test() != 1 || a.defaultFunc() != 2 || A.staticFunc() != 21) {
        return 1
    }
    if (a.testInnerInterface() != 0 || a.testInnerClass() != 0) {
        return 2
    }
    print("PASS\n")
    return 0
}
