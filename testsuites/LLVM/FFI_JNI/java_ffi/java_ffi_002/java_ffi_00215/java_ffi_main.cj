// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in child\n
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

class child <: InteropTest {
  func test(): Unit {
    print("in child\n")
  }
}

func main() {
  var child = child()
  child.test()
  return 0
}
