// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Parent {
    open static func foo() : Int32{ // EXPECTED: regex modifiers 'static' and 'open' are conflict in function declaration
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
