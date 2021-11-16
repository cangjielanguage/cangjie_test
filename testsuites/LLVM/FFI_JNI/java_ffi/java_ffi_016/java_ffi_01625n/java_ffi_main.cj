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
class A <: InteropTest.InnerClass {
    override func test(): Int32 {
        return num + staticNum + finalNum + staticFinalNum + InteropTest.n2 + n1; // EXPECTED: regex undeclared identifier 'n1'
    }
}

func main(): Int64 {
    var a: A = A()
    if (a.test() == 1113 && A.staticFunc() == 1010) {
        a.show<JString>(J"in cangjie")
        return 0
    }
    return 1
}
