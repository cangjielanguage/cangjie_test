// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%jar -cvf InteropTest.jar InteropTest.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*

func main(): Int64 {
    InteropTest.num = 0 // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    if (InteropTest.num == 0) {
        print("PASS\n")
        return 0
    }
    return 1
}
