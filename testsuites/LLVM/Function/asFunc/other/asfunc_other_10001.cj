// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A {
    operator func ()(){}
}

class B <: A{}

func main(): Int64 {
    B()()
    return 0
}
