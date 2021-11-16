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

class A <: InteropTest.InnerClass {} // EXPECTED: regex Class 'A' should have '@java' annotation

func main(): Int64 {
    var a: A = A()
    if (a.test() == 1111 && A.staticFunc() == 1010) {
        a.show<JString>(J"in cangjie")
        return 0
    }
    return 1
}
