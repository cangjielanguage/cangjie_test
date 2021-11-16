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
    var inner: InteropTest.InnerClass<JString> = InteropTest.InnerClass<JString>()
    inner.show<JString>(JArray<InteropTest>([InteropTest(), InteropTest()])) // EXPECTED: regex 'show' is not a member of class 'InnerClass'
    return 0
}
