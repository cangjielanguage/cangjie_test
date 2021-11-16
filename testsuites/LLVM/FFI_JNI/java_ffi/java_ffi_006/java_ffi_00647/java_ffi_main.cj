// DEPENDENCE: InteropTest.cj InteropTest.java Animal.java
// EXEC:%javac InteropTest.java Animal.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda Animal.class Animal.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan num = 1\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*


@java
external class Dog <: Animal {
    public var num: Int32 = 2
}

func main() {
    var interoptest: InteropTest = InteropTest()
    var dog: Dog = Dog()
    interoptest.test<Animal>(dog)
    return 0
}
