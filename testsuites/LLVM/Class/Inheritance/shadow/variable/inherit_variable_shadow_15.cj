// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Father {
    static public var a  = 1
}

class Child <: Father {
    public var a  = 2  // EXPECTED: regex error.*? non-static member 'a' cannot have the same name with static member in parent class or interfaces
}

class Son <: Father {
    static var a  = 3  // EXPECTED: regex error.*? the variable 'a' must not shadow a member variable of the supertype
}