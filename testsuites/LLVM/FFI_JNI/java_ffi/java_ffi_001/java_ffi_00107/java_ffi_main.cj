// DEPENDENCE: InteropTest.cj InteropTest.java Cloneable.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file Cloneable.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f
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
  var obj = interoptestchild.clone()
  var temp = obj.clone()
  if (!interoptestchild.isJavaObject(obj)) {
    return 1
  }
  if (obj.hashCode() != interoptestchild.testObject(obj)) {
    return 2
  }
  if (temp.hashCode() != interoptestchild.testObject(temp)) {
    return 3
  }
  return 0
}
