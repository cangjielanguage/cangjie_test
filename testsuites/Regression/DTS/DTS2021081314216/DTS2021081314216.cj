// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

import test.*
import java.lang.*
import ffi.java.*

@java
class A <: InteropTest.InnerInterface {}

class Test<T> where t <: InteropTest.InnerInterface {
    var t: T
    init(t: T) {
        this.t = t
    }
}

func main(): Int64 {
    var test: Test<A> = Test<A>(A())
    if (test.t.defaultFunc() == 2) {
        test.t.show<A>(JArray<A>([A(), A()]))
        return 0
    }
    return 1
}