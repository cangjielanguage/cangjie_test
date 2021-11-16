// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%jar -cvf InteropTest.jar InteropTest.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*

@java
class A <: InteropTest {
    func test1(): Int32 {
        return num // EXPECTED: regex field 'num' cannot be accessed without interface name 'InteropTest'
    }

    static func test2(): Int32 {
        return num // EXPECTED: regex field 'num' cannot be accessed without interface name 'InteropTest'
    }
}

func main(): Int64 {
    var a: A = A()
    if (a.test1() == 1 && A.test2() == 1) {
        print("PASS\n")
        return 0
    }
    return 1
}
