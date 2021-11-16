// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%class2panda 'InteropTest$InnerClass.class' 'InteropTest$InnerClass.panda'
// EXEC:%class2panda 'InteropTest$Father.class' 'InteropTest$Father.panda'
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*
from ffi import java.*

@java
class A <: InteropTest.InnerClass {
    override func test(): Int32 {
        return num + staticNum + finalNum + staticFinalNum + InteropTest.n2 + fatherStaticNum + fatherNum; // EXPECTED: regex undeclared identifier 'fatherNum'
    }

    redef static func staticFunc(): Int32 {
        return staticNum + staticFinalNum + InteropTest.n2 + fatherStaticNum; // EXPECTED: regex undeclared identifier 'fatherStaticNum'
    }
}

func main(): Int64 {
    var a: A = A()
    if (a.test() == 1115 && A.staticFunc() == 1013) {
        a.show<JString>(J"in cangjie")
        return 0
    }
    return 1
}
