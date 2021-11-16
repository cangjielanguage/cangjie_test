// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Father {
    public var a  = 1
}

class Child <: Father {
    static var a  = 2  // EXPECTED: regex error.*? static member 'a' cannot have the same name with non-static member in parent class or interfaces
}