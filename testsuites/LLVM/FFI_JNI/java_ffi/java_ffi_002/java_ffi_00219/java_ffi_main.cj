// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

func main() {
  var interoptest = InteropTest()
  if (interoptest.num1 >= 1.1100001 || interoptest.num1 <= 1.1099999) {
    return 1
  }
  if (interoptest.num2 >= 1.110000001 || interoptest.num2 <= 1.109999999) {
    return 2
  }
  return 0
}
