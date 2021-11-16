// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update{
    func assert(a:This):Int64
}

class A{}

append A with update{
    func assert(a:A):Int64{return 0}
}

func g<T>(a:T) where T <: update{
    return assert(a)
}

func main(){
    return g<A>(A())
}