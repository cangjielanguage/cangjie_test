// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in interface A test1\nin InteropTest test2\nin class B, i = -1\n
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

@java
interface A <: InteropTest {
    func test1(): Unit {
        print("in interface A test1\n")
    }
}

@java
class B <: A {
    func f(i: Int32): Unit {
        print("in class B, i = ${i}\n")
    }
}

func main() {
  var b = B()
  b.test1()
  b.test2()
  b.f(-1)
  return 0
}
