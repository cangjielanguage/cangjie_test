// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{}

class B <: A{}

func main(): Int64 {
    var a  = A()
    var MyTuple : A*A = (A(),a)
    return 0
}
