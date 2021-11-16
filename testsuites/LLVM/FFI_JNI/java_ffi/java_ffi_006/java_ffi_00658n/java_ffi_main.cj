// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not Exception

import java.lang.*

external open class InteropTest {
    public var num: Int32 = 1
}

external class Child <: InteropTest {
    public var num: Int32 = 2 // EXPECTED: regex the variable 'num' must not shadow a member variable of the supertype
}

func testfunc<T>(value: T) where T <: InteropTest {
    print("num = " + value.num.toString() + "\n")
}

func main() {
    var child: Child = Child()
    testfunc<InteropTest>(child)
    return 0
}
