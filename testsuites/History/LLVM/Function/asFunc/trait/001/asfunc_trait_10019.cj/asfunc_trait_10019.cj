// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append A with C{
    func asFunc(input:A):Int64{0}
}

record A{}

func main(): Int64 {
    var a : A = A()
    return a()
}
