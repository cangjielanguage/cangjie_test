// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 12300
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

func main() {
    var a: InteropTest = InteropTest()
    a.firstName = 123
    a.lastName = 1234
    a.description = 12345
    InteropTest.serialize(a)
    var b = InteropTest.deserialize()
    print(b.firstName.toString())
    print(b.lastName.toString())
    print(b.description.toString())
    return 0
}
