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

open class A <: java.lang.Object & Cloneable {}

class B <: A & Cloneable {}

func main() {
  var interoptest = InteropTest()
  var obj1 = A()
  var obj2 = B()
  var obj3 = A().clone()
  var obj4 = B().clone()
  if (!interoptest.isJavaObject(obj1) && !interoptest.isJavaObject(obj2)) {
    return 1
  }
  if (!interoptest.isJavaObject(obj3) && !interoptest.isJavaObject(obj4)) {
    return 2
  }
  if (!obj2.equals(obj2) && obj2.equals(obj1)) {
    return 3
  }
  if (!obj4.equals(obj4) && obj4.equals(obj2)) {
    return 4
  }
  return 0
}
