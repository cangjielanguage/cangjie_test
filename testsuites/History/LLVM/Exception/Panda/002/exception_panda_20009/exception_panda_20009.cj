// DEPENDENCE: InteropTest.java
// EXEC:%javac InteropTest.java
// EXEC:echo "java.lang=%libdir/java.lang/java.lang.cjo" > ast-cfg
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC:%compiler %cmp_opt -i ast-cfg %f -o %output
// EXEC:LD_LIBRARY_PATH=./:$LD_LIBRARY_PATH %run --boot-panda-files "%panda_lib:%java_lib:%output" %panda_args InteropTest.bin InteropTest::main 2>&1 | compare %f
// ASSERT: scan-not in InteropTest
// ASSERT: scan Caused by: default.A
// ASSERT: scan exception in cangjie

import java.lang.Object

class A <: Throwable{}

@java
class CJClass {
    func test(input: Int32): Int32 {
        throw A()
        return input
    }
}