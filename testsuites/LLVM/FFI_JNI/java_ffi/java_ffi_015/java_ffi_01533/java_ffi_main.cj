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
interface A <: InteropTest.InnerInterface {
    func test(): Int32 {
        return InteropTest.InnerInterface.num2
    }

    static func staticFunc(): Int32 {
        return InteropTest.InnerInterface.num2 + 20;
    }
}

@java
class B <: A {}

@java
class C <: InteropTest.InnerInterface.innerInterface {
    func test(): Int32 {
        return InteropTest.InnerInterface.innerInterface.num3
    }
}

@java
class D <: InteropTest.InnerInterface.innerClass {}

func main(): Int64 {
    var b: B = B()
    var c: C = C()
    var d: D = D()
    if (b.test() != 1 || b.defaultFunc() != 2 || B.staticFunc() != 21) {
        return 1
    }

    if (c.test() != 10 || c.defaultFunc() != 11 || C.staticFunc() != 12) {
        return 2
    }

    if (d.test() != 21 || d.defaultFunc() != 11 || D.staticFunc() != 30) {
        return 3
    }

    print("PASS\n")
    return 0
}
