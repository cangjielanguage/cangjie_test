// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerInterface.class' 'InteropTest$InnerInterface.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*

class A <: InteropTest.InnerInterface { // EXPECTED: regex Class 'A' should have '@java' annotation
    func test(): Int32 {
        return InteropTest.InnerInterface.num2
    }
}

func main(): Int64 {
    var inner: InteropTest.InnerInterface = A()
    if (inner.test() == 1 && inner.defaultFunc() == 2 && A.staticFunc() == 3) {
        print("PASS\n")
        return 0
    }
    return 1
}
