// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class GrandFather {
    static protected var a  = 1
}

open class Father <: GrandFather {}

class Child <: Father {
    public var a  = 2  // EXPECTED: regex error.*? non-static member 'a' cannot have the same name with static member in parent class or interfaces
}