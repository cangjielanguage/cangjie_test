// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan -1\n2\n
// ASSERT: scan-not Exception

import test.*

func main() {
    let cls1: InteropTest = InteropTest(1)
    var cls2: Option<InteropTest> = cls1.field
    var s: Int32 = match(cls2) {
        case Some(res) => res.num
        case $None => -1
    }
    print(s.toString() + "\n")
    cls1.field = InteropTest(2)
    cls2 = cls1.field
    s = match(cls2) {
        case Some(res) => res.num
        case $None => -1
    }
    print(s.toString() + "\n")
    return 0
}
