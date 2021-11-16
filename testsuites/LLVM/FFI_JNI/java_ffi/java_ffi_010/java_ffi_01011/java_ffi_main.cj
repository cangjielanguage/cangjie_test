// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan sum = 10\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func main() {
    let cls: InteropTest = InteropTest()
    var n: Int32 = cls.myList.length()
    var i: Int32 = 0
    var sum: Int32 = 0
    while(n > 0) {
        var m: Int32 = cls.myList[i].length()
        var j: Int32 = 0
        while (m > 0) {
            sum = sum + cls.myList[i][j]
            j = j + 1
            m = m - 1
        }
        i = i + 1
        n = n - 1
    }
    print("sum = ${sum}\n")
    return 0
}
