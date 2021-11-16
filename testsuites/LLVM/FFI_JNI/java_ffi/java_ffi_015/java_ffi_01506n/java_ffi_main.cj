// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%jar -cvf InteropTest.jar InteropTest.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*

@java
interface A <: InteropTest {
    static func test(): Int32 {
        return num // EXPECTED: regex field 'num' cannot be accessed without interface name 'InteropTest'
    }
}

@java
class B <: A {
}

func main(): Int64 {
    if (B.test() == 1) {
        print("PASS\n")
        return 0
    }
    return 1
}
