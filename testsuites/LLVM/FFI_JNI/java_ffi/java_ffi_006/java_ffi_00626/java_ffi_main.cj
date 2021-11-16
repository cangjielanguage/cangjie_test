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
// ASSERT: scan animal Removed\nAnimal!\n
// ASSERT: scan-not Exception

import test.*
import java.lang.*
import java.util.List as JList
import java.util.ArrayList as JArrayList

@java
class Child<T> <: InteropTest<T> {}

func main() {
    var interoptest: Child<Cat> = Child<Cat>()
    var animalList: JList<java.lang.Object> = JArrayList<java.lang.Object>();
    var animal: Animal = Animal()
    var cat: Cat = Cat()
    animalList.add(animal)
    animalList.add(cat)
    interoptest.removeCat(animalList, cat)
    interoptest.printAll(animalList)
    return 0
}
