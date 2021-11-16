// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan sum = 6\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

@java
class B <: A {
    override func test(array: JArray<Int64>): Unit {
        var sum: Int64 = array[Int32(0)] + array[Int32(1)] + array[Int32(2)]
        print("sum = ${sum}\n")
    }
}

func main() {
    let cls: InteropTest = InteropTest()
    cls.array = JArray<Int64>([1, 2, 3])
    let b: B = B()
    cls.test(b)
    return 0
}
