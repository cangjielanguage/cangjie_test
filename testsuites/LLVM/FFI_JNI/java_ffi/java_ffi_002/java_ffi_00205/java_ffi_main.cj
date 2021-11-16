// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan -2147483648\nin child class\n
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

@java
class child <: InteropTest {
    func test(num: Int64): Unit {
        print("in child class\n")
    }
}

func main() {
  var interoptest = child()
  interoptest.test(Int32(2147483648))
  interoptest.test(2147483648)
  return 0
}
