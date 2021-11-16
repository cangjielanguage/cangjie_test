// EXEC: %compiler %cmp_opt %f
// EXEC:%run --boot-panda-files "%panda_lib" %panda_args %output %run_args 2>&1 | compare %f
// ASSERT: scan num = 1\n
// ASSERT: scan-not Exception

import java.lang.*

@java
external open class InteropTest {
    public var num: Int32 = 1
}

@java
external class Child <: InteropTest {
    public var num: Int32 = 2
}

@java
func testfunc<T>(value: T) where T <: InteropTest {
    print("num = " + value.num.toString() + "\n")
}

func main() {
    var child: Child = Child()
    testfunc<InteropTest>(child)
    return 0
}
