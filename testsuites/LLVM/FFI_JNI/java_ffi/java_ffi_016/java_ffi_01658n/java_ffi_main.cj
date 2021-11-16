// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:%class2panda InteropTest.class InteropTest.panda
// EXEC:%jar -cvf InteropTest.jar *.class
// EXEC:%autoSDK %sdk_opt InteropTest.jar -o ./
// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f

import test.*
import java.lang.*

@java
class A <: InteropTest {} // EXPECTED: regex super class 'InteropTest' is not inheritable, use 'open' modifier instead

func main(): Int64 {
    var a: A = A()
    return 0
}
