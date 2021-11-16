// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerInterface.class' 'InteropTest$InnerInterface.panda'
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*

@java
class A <: InteropTest {
    func test(inner: InnerInterface): Int64 { // EXPECTED: regex inner interface 'InnerInterface' cannot be accessed without name 'InteropTest'
        if (inner.test() == 4 && inner.defaultFunc() == 2 && InnerInterface.staticFunc() == 3) { // EXPECTED: regex inner interface 'InnerInterface' cannot be accessed without name 'InteropTest'
            print("PASS\n")
            return 0
        }
        return 1
    }
}


func main(): Int64 {
    var a: A = A()
    return a.test(InteropTest.cls)
}
