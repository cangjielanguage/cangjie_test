// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" > ast-cfg
// EXEC:echo "ffi.java=%libdir/ffi/java/ffi.java.cjo" >> ast-cfg
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -i ast-cfg %f -o %output
// EXEC:LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run --boot-panda-files "%panda_lib:%java_lib:%output" %panda_args InteropTest.bin InteropTest::main 2>&1 | compare %f
// ASSERT: scan-not in InteropTest
// ASSERT: scan exception in cangjie!
// ASSERT: scan getMessage in cangjie!
// ASSERT: scan toString in cangjie!

import java.lang.Object
from ffi import java.JString
import java.lang.RuntimeException

@java
class CJClass <: java.lang.RuntimeException {
    override func printStackTrace(){print("exception in cangjie!")}
    override func getMessage():JString{J"getMessage in cangjie!"}
    override func toString():JString{J"toString in cangjie!"}
}