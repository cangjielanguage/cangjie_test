// DEPENDENCE: InteropTest.cj InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*

func main() {
  var interoptest: InteropTest<Int8> = InteropTest<Int8>() // EXPECTED: regex Type argument in java interoperation should inherit 'java.lang.Object'
  interoptest.test(-128)
  return 0
}
