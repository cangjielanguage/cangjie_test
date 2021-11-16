// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    static protected var test : Array<Bool> = @{true}
}

class Data <: Base {
    let test : Array<Int32> = @{} // EXPECTED: regex  non-static member 'test' cannot have the same name with static member in parent class or interfaces
}

func main(): Int64 {
    return 1
}