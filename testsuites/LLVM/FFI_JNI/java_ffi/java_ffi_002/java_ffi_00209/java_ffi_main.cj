// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan 1\nin child\n
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

@java
class child <: InteropTest {
  override func test(input: Int32): Unit { print("in child\n") }

  func test(): Unit {
    super.test(1)
    test(1)
    if (num1 != 10 || num2 != 20) {
      super.test(2)
    }
  }
}

func main() {
  var child = child()
  child.test()
  return 0
}
