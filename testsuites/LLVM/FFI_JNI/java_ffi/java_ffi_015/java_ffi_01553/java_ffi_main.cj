// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda ./ InteropTest.panda
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan show: in cangjie\nPASS\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
from ffi import java.*

@java
class A <: InteropTest.InnerClass {
    func absFunc(): Int32 {
        return staticNum1 + num2 + InteropTest.num1;
    }

    func show<T>(t: T): Unit where T <: JString {
        print("show: " + toString(t));
    }

    override func test(): Int32 {
        return num2 + 10;
    }

    redef static func staticFunc(): Int32 {
        return staticNum1 + 10;
    }
}

@java
class B <: InteropTest.InnerClass.innerInterface {
    func test(): Int32 {
        return InteropTest.InnerClass.innerInterface.num3 + InteropTest.InnerClass.staticNum1;
    }
}

@java
class C <: InteropTest.InnerClass.innerClass {}

func main(): Int64 {
    var a: A = A()
    var b: B = B()
    var c: C = C()
    if (a.absFunc() != 12 || a.test() != 11 || A.staticFunc() != 20 || A.staticFunc() != 20) {
        return 1
    }
    if (b.test() != 20 || b.defaultFunc() != 11 || B.staticFunc() != 12) {
        return 2
    }
    if (c.test() != 21 || C.staticFunc() != 30) {
        return 3
    }
    a.show<JString>(J"in cangjie\n")
    print("PASS\n")
    return 0
}
