// DEPENDENCE: InteropTest.java InteropTest1.java InteropTest2.java
// EXEC:%javac InteropTest.java InteropTest1.java InteropTest2.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda InteropTest1.class InteropTest1.panda
// EXEC:%class2panda InteropTest2.class InteropTest2.panda
// EXEC:%jar -cvf InteropTest.jar InteropTest.class InteropTest1.class InteropTest2.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*

@java
interface A <: InteropTest & InteropTest1 & InteropTest2 {
    func test1(): Int32 {
        return num // EXPECTED: regex redefinition of imported declaration 'num'
    }

    static func test2(): Int32 {
        return num // EXPECTED: regex redefinition of imported declaration 'num'
    }
}

@java
class B <: A {}

func main(): Int64 {
    var b: B = B()
    if (b.test1() == 1 && B.test2() == 1) {
        print("PASS\n")
        return 0
    }
    return 1
}
