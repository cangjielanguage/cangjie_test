// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class OuterClass {
    class InnerClass{
        var a: Int32 = 2
    }
}

type ClassB = InnerClass    // EXPECTED: regex undeclared type name 'InnerClass'

func main(): Int64 {
    var inner: ClassB = InnerClass()
    if (inner.a == 2) {
        return 0
    }
    return 1
}