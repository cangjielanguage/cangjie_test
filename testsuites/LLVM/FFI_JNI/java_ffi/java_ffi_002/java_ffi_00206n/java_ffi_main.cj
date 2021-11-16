// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import test.*
import java.lang.Object

func main() {
  var interoptest = InteropTest() // EXPECTED: regex undeclared identifier 'InteropTest'
  interoptest.test(1)
  return 0
}
