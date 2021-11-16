// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

class InteropTestChild <: InteropTest {
  func testObject(input: core.Object): Int32 {
    return printHashCode(input)
  }
}

func main() {
  var interoptestchild = InteropTestChild()
  if (!interoptestchild.isJavaObject(interoptestchild)) {
    return 1
  }
  if (interoptestchild.hashCode() != interoptestchild.testObject(interoptestchild)) {
    return 2
  }
  return 0
}
