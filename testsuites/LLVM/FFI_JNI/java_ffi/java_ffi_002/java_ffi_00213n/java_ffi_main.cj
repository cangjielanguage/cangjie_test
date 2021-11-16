// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


import test.*
import java.lang.Object

class child <: InteropTest {
  func test(): Unit {
    num1 = 1 // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    num2 = 2 // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
  }
}

func main() {
  var child = child()
  child.test()
  return 0
}
