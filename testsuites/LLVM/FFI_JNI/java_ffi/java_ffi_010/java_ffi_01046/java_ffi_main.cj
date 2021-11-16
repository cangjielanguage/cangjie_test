// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in cangjie sum = 15\nin java sum = 15\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func main() {
    let cls: InteropTest = InteropTest()
    var sum: Int32 = 0
    sum = sum + cls.myList[0] + cls.myList[1] + cls.myList[2] + cls.myList[3] + cls.myList[4]
    print("in cangjie sum = ${sum}\n")
    cls.test(cls.myList)
    return 0
}
