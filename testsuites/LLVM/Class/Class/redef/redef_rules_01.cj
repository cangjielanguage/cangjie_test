// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

abstract class Aoo {
    static func foo(x : Int64): Int64 //EXPECTED: regex error.*?function 'foo' can not be abstract
}

class Boo <: Aoo {
    redef static func foo(x : Int64): Int64 {
        return 1
    }
}
