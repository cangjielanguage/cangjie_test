// DEPENDENCE: InteropTest.cj InteropTest.java A.java
// EXEC:%javac InteropTest.java A.java
// EXEC:%class2panda InteropTest.class InteropTest.bin
// EXEC: %compiler %cmp_opt -c InteropTest.cj -o InteropTest.panda
// EXEC: %compiler %cmp_opt %f
// EXEC:%run %run_opt %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan in cangjie\n
// ASSERT: scan throw Exception\n
// ASSERT: scan default.TestException: throw in cangjie

import test.*
import java.lang.*
import java.lang.Exception as JException
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
class TestException <: Exception {
    init(str: JString) {
        super(toString(str))
    }
}
