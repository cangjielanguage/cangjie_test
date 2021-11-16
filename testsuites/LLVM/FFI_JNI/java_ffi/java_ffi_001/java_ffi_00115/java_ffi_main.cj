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

open class A <: java.lang.Object & Cloneable {
  func test(): Int64 {return 11}
}

class B <: A & Cloneable {}

func main() {
  var interoptest = InteropTest()
  var obj1 = A()
  var obj2 = B()
  var obj3 = A().clone()
  var obj4 = B().clone()
  if (interoptest.printHashCode(obj1) != obj1.hashCode()) {
    return 1;
  }
  if (interoptest.printHashCode(obj2) != obj2.hashCode()) {
    return 2;
  }
  if (interoptest.printHashCode(obj3) != obj3.hashCode()) {
    return 3;
  }
  if (interoptest.printHashCode(obj4) != obj4.hashCode()) {
    return 4;
  }
  return 0
}
