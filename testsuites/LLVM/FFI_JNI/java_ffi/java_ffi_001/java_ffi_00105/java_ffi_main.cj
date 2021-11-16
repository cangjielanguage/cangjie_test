// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

func main() {
  var interoptest = InteropTest()
  var obj = java.lang.Object()
  if (!interoptest.isJavaObject(obj)) {
    return 1
  }
  var obj_temp = interoptest.testObject(obj)
  if (!interoptest.isJavaObject(obj_temp)) {
    return 2
  }
  if (!obj.equals(obj_temp)) {
    return 3
  }
  return 0
}
