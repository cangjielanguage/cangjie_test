// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan res = true\nOK\nsum = 15\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func main() {
    let cls: InteropTest = InteropTest()
    var a: JArray<Int16> = cls.getArray()
    var res: Bool = a.equals(cls.array)
    print("res = ${res}\n")
    if (a.hashCode() == cls.array.hashCode()) {
        print("OK\n")
    }
    cls.test(a)
    print(toString(a.toString()))
    return 0
}
