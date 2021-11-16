// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

open class Parent {
    static public var field : Int32 = 1
}

class Child <: Parent {}

func main(): Int64 {
    if (Child.field != 1) {
        return 1
    }
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
