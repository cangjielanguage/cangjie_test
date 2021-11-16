// DEPENDENCE: InteropTest.cj InteropTest.java InteropTest2.java
// EXEC:%javac InteropTest.java InteropTest2.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda InteropTest2.class InteropTest2.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in InteropTest\nin InteropTest2\n
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

func main() {
  var InteropTest = InteropTest()
  var InteropTest2 = InteropTest2()
  InteropTest.test()
  InteropTest2.test()
  return 0
}
