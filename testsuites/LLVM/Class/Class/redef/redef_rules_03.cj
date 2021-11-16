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
    redef static func foo(x : Int32) { // EXPECTED: regex error.*?redefine function 'foo' does not have an redefined 'static' function
        return 2
    }
}