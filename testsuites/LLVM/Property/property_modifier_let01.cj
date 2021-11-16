// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// let
open class A {
    open prop let i: Int64 {
        get() { return 0 }
    }
}
class B <: A {
    override prop let i: Int64 {
        get() { return 1 }
    }
}

func main():Int64 {
    if ( B().i != 1) {
        return 1
    }
    if ( A().i != 1) {
        return 0
    }
    return 0
}
