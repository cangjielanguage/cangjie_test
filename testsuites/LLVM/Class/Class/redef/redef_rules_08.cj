// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Aoo {
    static func foo(x : Int64) {
        return 1
    }
}

class Boo <: Aoo {
    redef static func foo(x : Int64) { // EXPECTED: regex error.*?The return type of the override/redefine/implement function must be the same as or a subtype of the overridden/redefined/implemented function
        return "123"
    }
}