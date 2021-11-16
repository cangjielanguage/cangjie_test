// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*
from ffi import java.*

@java
class A <: InteropTest {
    func testFunc(inner: InnerClass): Int64 { // EXPECTED: regex inner class 'InnerClass' cannot be accessed without name 'InteropTest'
        if (inner.test() == 2 && InnerClass.staticFunc() == 11) { // EXPECTED: regex inner class 'InnerClass' cannot be accessed without name 'InteropTest'
            inner.show<JString>(J"in cangjie")
            print("PASS\n")
            return 0
        }
        return 1
    }
}

func main(): Int64 {
    var a: A = A()
    var inner: InteropTest.InnerClass = InteropTest.InnerClass()
    return a.testFunc(inner)
}
