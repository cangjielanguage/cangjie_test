// DEPENDENCE: InteropTest.cj InteropTest.java InteropTest2.java
// EXEC:%javac InteropTest.java InteropTest2.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda InteropTest2.class InteropTest2.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in InteropTest\n4095\n-2147483648\n24\n152\n
// ASSERT: scan-not Exception

import test.*
import java.lang.Object

func main() {
  var interoptest = InteropTest()
  var interoptest2 = InteropTest2()
  interoptest.test()
  interoptest2.test(0xff____f)
  interoptest2.test(-21474____8364__8)
  interoptest2.test(0o3__0_______)
  interoptest2.test(0b1001_____1000______)
  return 0
}
