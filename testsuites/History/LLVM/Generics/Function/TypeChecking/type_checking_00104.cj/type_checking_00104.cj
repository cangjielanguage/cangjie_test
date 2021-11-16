// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update{
    func assert(a:This):Int32
}

class A{}

append A with update{
    func assert(a:A):Int32{return 0}
}

func g<T>(a:T) where T <: update{
    func assert(a:A):Int32{return 1}
    return 0
}

func main(){
    return 0
}