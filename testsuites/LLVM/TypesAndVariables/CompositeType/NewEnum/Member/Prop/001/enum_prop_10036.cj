// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    func f(){A()}
}

func main(): Int64 {
    var i = A()
    i.f().f()
    return 0
}
