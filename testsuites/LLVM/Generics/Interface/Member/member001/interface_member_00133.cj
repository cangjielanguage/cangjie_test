// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I<X>{
    static func foo(a:X):X{a}
}
class Test<X> <: I<X>{}

func main(){
    return Test<Int64>.foo(0)
}