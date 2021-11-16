// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( C3.foo() != 3 || C2.foo() != 1) {
        return 1
    }
    return 0
}

open class C1 {
    static func foo() {
        return 1
    }
}

open class C2 <: C1 {
}

class C3 <: C1 {
    redef static func foo() {
        return 3
    }
}