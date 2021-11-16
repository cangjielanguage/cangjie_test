// DEPENDENCE: InteropTest.cj InteropTest.java Parent.java
// EXEC:%javac InteropTest.java Parent.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda Parent.class Parent.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in Child\n


import test.*
import java.lang.Object

@java
class Child <: Parent {
  override func test(): Unit { print("in Child\n") }
}

func main() {
  var interoptest = InteropTest()
  var child = Child()
  interoptest.test(child)
  return 0
}
