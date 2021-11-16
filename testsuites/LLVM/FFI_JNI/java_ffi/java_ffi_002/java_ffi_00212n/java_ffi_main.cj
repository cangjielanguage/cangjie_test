// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f 2>&1 | compare InteropTest.cj

import test.*
import java.lang.Object

class child <: InteropTest {
  override func test(input: Int32): Unit { print("in child\n") }
}

func main() {
  var interoptest = InteropTest()
  var child = child()
  interoptest.test(1)
  child.test(1)
  if (interoptest.num1 != 10 || interoptest.num2 != 20) {
    interoptest.test(2)
  }
  if (child.num1 != 1 || child.num2 != 2) {
    child.test(2)
  }
  return 0
}
