// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( Coo.foo() != 2 || Boo.foo() != 1) {
        return 1
    }
    return 0
}

open class Boo {
    static func foo() {
        return 1
    }
}

class Coo <: Boo {
    redef static func foo() {
        return 2
    }
}