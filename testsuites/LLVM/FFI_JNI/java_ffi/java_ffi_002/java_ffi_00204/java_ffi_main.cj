// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 2147483647\n
// ASSERT: scan-not Exception

import test.InteropTest as Test
import java.lang.Object

class InteropTest {
    func test(input: Int32): Unit { print("0") }
}

func main() {
  var interoptest = Test()
  interoptest.test(2147483647)
  return 0
}
