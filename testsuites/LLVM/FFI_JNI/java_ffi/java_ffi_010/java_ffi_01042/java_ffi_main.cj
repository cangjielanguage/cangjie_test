// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// ERRCHECK: %compiler %cmp_opt %f
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func main() {
    let cls: InteropTest = InteropTest()
    var a: List<Int64> = []
    var b: List<Int64> = [1]
    cls.test(a.ToJArray())
    cls.test([].ToJArray()) // EXPECTED: regex empty list literal type cannot be inferred
    cls.test(JArray<Int64>([]))
    cls.test(b.ToJArray())
    cls.test([1].ToJArray())
    cls.test(JArray<Int64>([1]))
    return 0
}
