// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Parent {
    static public func foo() : Int32{
        return 1
    }
}

class Child <: Parent {}

func main(): Int64 {
    if (Child.foo() != 1) {
        return 1
    }
    return 0
}
