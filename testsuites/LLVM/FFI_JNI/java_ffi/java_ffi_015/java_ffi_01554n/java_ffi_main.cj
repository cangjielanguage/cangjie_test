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

class A <: InteropTest.InnerClass { // EXPECTED: regex Class 'A' should have '@java' annotation
    func absFunc(): Int32 {
        return staticNum + num2;
    }
}

func main(): Int64 {
    var a: A = A()
    if (a.absFunc() == 11 && a.test() == 2 && A.staticFunc() == 11) {
        a.show<JString>(J"in cangjie")
        print("PASS\n")
        return 0
    }
    return 1
}
