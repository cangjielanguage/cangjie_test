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

func main(): Int64 {
    var inner: InteropTest.InnerClass = InteropTest.InnerClass() // EXPECTED: regex can not access field 'InnerClass'
    if (inner.test() == 1111 && InteropTest.InnerClass.staticFunc() == 1010) {
        inner.show<JString>(J"in cangjie")
        return 0
    }
    return 1
}
