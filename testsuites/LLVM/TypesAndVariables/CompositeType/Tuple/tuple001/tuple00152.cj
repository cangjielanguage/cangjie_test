// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{}

open class B <: A{}

open class C <: B{}

func main(): Int64 {
    var a = A()
    var MyTuple : A*A*A = (a,B(),C())
    return 0
}
