// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in cangjie\n
// ASSERT: scan throw Throwable\n
// ASSERT: scan default.TestException: throw in cangjie

import test.*
import java.lang.*
import java.lang.Throwable as JThrowable
from ffi import java.*

@java
class B <: A {
    override func test(): Unit {
        print("in cangjie\n")
        throw TestException(J"throw in cangjie")
    }
}

func main() {
    let cls: InteropTest = InteropTest()
    cls.test(B())
    return 0
}

@java
class TestException <: Throwable {
    init(str: JString) {
        super(toString(str))
    }
}
