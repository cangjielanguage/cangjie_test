// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in InteropTest\n
// ASSERT: scan-not Exception

import test.InteropTest as NewTest
import java.lang.Object

@java
class InteropTest <: NewTest {
}

func main() {
  var interopTest = InteropTest()
  interopTest.test()
  return 0
}
