// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( C2.foo() != 3 ) {
        return 1
    }
    return 0
}

open class C1 {
    static func foo() {
        return 1
    }
}

interface I{
    static func foo() {
        return 2
    }
}

class C2 <: C1 & I {
    redef static func foo() {
        return 3
    }
}