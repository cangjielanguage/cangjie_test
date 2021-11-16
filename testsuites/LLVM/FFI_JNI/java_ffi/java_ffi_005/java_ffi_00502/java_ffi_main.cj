// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in Child\n

import test.*
import java.lang.*

@java
class Child <: InteropTest {
    override func test(): Unit {
        print("in Child\n")
    }
}

func main() {
  var child = Child()
  child.test()
  return 0
}
