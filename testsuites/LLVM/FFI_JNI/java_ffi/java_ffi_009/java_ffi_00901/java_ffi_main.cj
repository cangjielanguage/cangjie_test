// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan null\nnull\nException in thread "main" java.lang.NullPointerException\n

import test.*
from ffi import java.*

func main() {
    let cls: InteropTest = InteropTest()
    print(toString(cls.field) + "\n")
    cls.test(cls.field)
    let str: JString = cls.field
    return 0
}
