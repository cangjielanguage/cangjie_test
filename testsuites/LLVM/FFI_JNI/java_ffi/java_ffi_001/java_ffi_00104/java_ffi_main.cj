// DEPENDENCE: InteropTest.cj InteropTest.java Cloneable.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file Cloneable.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan-not Exception

import test.*
import java.lang.*

func main() {
  var interoptest = InteropTest()
  if (!interoptest.isJavaObject(interoptest)) {
    return 1
  }
  if (!interoptest.isJavaObject(interoptest.clone())) {
    return 2
  }
  return 0
}
