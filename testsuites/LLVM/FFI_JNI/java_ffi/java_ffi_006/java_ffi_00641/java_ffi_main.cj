// DEPENDENCE: InteropTest.cj InteropTest.java Animal.java Cat.java jlang.cj jutil.cj
// EXEC:%javac InteropTest.java Animal.java Cat.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%class2panda Animal.class Animal.bin
// EXEC:%class2panda Cat.class Cat.bin
// EXEC:%compiler %cmp_opt -c %java_lang_file jlang.cj -o java.lang.panda
// EXEC:%compiler %cmp_opt -c jutil.cj -o java.util.panda
// EXEC:%compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC:%compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan animal Added\nCat!\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
import java.util.List as JList
import java.util.ArrayList as JArrayList

func main() {
    var interoptest: InteropTest = InteropTest()
    var animalList: JList<java.lang.Object> = JArrayList<java.lang.Object>();
    var cat: Cat = Cat()
    interoptest.addCat<Cat>(animalList, cat)
    interoptest.printAll<Cat>(animalList)
    return 0
}
