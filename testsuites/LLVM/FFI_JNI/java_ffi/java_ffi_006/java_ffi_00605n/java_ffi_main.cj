// DEPENDENCE: InteropTest.cj InteropTest.java jlang.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC-PIPE-1: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda 2>&1 | compare InteropTest.cj

import test.*
import java.lang.Integer

func main() {
  var interoptest: Child<Integer> = Child<Integer>(Integer(-12345))
  var tmp: Integer = interoptest.get()
  interoptest.test(tmp)
  return 0
}
