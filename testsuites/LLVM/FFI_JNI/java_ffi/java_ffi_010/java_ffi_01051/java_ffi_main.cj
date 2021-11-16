// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan sum = 600\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

@java
class B <: A {
    init(num: Int32) {
        super(num)
    }
}

func main() {
    let cls: InteropTest = InteropTest()
    var array: JArray<A> = JArray<A>([B(100), B(200), B(300)])
    cls.test(array)
    return 0
}
