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
  var interopTest = InteropTest()
  interopTest.test(1) // EXPECTED: regex no matching function declaration for function call 'test'
  if (interopTest.num1 != 10 || interopTest.num2 != 20) {
    interopTest.test(2)
  }
  return 0
}
