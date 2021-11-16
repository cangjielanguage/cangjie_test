// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    func f(a: Int64): Unit {}
}

class Sub <: Base {
    func f(a: Float64): Unit {}
}


func main():Int64{
    Base().f(1)
    Sub().f(1.0)
    return 0
}