// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" > ast-cfg
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -i ast-cfg %f -o %output 2>&1 | compare %f
// ASSERT: scan overridden function 'printStackTrace' should have 'open' modifier

import java.lang.Object

@java
class CJClass <: Error {
    override func printStackTrace(){print("exception in cangjie!")}
}