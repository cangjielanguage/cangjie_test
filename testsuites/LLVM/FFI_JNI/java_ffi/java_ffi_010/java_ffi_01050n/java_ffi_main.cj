// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda A.class A.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
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
    var array: JArray<B> = JArray<B>([B(100), B(200), B(300)])
    cls.test(array) // EXPECTED: regex argument is mismatched with parameter type 'JArray<Class-A>'
    return 0
}
