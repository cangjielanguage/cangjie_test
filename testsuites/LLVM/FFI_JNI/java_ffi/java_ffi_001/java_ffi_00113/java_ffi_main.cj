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

open class A <: java.lang.Object & Cloneable {
  func test(): Int64 {return 11}
}

class B <: A & Cloneable {}

func main() {
  var interoptest = InteropTest()
  var obj1 = A()
  var obj2 = B()
  var obj3 = A().clone() as A
  var obj4 = B().clone() as B
  if (!interoptest.isJavaObject(obj1) || obj1.test() != 11) {
    return 1
  }
  if (!interoptest.isJavaObject(obj2) || obj2.test() != 11) {
    return 2
  }
  if (!interoptest.isJavaObject(obj3) || obj3.test() != 11) {
    return 3
  }
  if (!interoptest.isJavaObject(obj4) || obj4.test() != 11) {
    return 4
  }
  return 0
}
