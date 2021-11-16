// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

@java
class InteropTestChild <: InteropTest {
  func testObject(input: java.lang.Object): java.lang.Object {
    printInt32(input.hashCode())
    return input
  }
}

func main() {
  var interoptestchild = InteropTestChild()
  var obj = interoptestchild.testObject(interoptestchild)
  if (!interoptestchild.isJavaObject(obj)) {
    return 1
  }
  if (!interoptestchild.equals(obj)) {
    return 2
  }
  return 0
}
