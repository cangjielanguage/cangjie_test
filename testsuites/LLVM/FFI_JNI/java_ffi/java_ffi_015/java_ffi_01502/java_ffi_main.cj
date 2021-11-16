// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%jar -cvf InteropTest.jar InteropTest.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f
// EXEC-PIPE:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan PASS\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*

var tmp1: Int32 = InteropTest.num
let tmp2: Int32 = InteropTest.num

func main(): Int64 {
    if (tmp1 == 1 && tmp2 == 1) {
        print("PASS\n")
        return 0
    }
    return 1
}
