// DEPENDENCE: InteropTest.cj InteropTest.java jlang.cj
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in Child\n-12345

import test.*
import java.lang.Integer

@java
class Child<T> <: InteropTest<T> {
    var num: T
    init(value: T) { this.num = value }
    func get(): T { return num }
    override func test(value: T): Unit {
        print("in Child\n")
        super.test(value)
    }
}

func main() {
  var interoptest: Child<Integer> = Child<Integer>(Integer(-12345))
  var tmp: Integer = interoptest.get()
  interoptest.test(tmp)
  return 0
}
