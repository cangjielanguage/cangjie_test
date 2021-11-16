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
    func test(): InteropTest.InnerClass { // EXPECTED: regex undeclared type name 'InnerClass'
        return InteropTest.InnerClass() // EXPECTED: regex 'InnerClass' is not a member of class 'InteropTest'
    }
}

func main(): Int64 {
    var a: A = A()
    var inner = a.test()
    if (inner.test() == 1111) {
        inner.show<JString>(J"in cangjie")
        return 0
    }
    return 1
}
