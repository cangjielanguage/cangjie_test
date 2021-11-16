// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in cangjie\n
// ASSERT: scan-not Exception

import test.*
from ffi import java.*

func main() {
    let cls1: InteropTest = InteropTest()
    var cls2: Option<JString> = cls1.test()
    var s: JString = match(cls2) {
        case Some(res) => res
        case $None => J"in cangjie"
    }
    print(toString(s) + "\n")
    return 0
}
