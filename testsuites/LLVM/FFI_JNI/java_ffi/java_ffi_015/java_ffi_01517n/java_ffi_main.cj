// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%jar -cvf InteropTest.jar InteropTest.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*

@java
class A <: InteropTest {}

func main(): Int64 {
    if (A.num == 1) { // EXPECTED: regex field 'num' cannot be accessed without interface name 'InteropTest'
        print("PASS\n")
        return 0
    }
    return 1
}
