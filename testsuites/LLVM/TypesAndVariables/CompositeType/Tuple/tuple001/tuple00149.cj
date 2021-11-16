// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{}

class B{}

func main(): Int64 {
    var a = A()
    var MyTuple : A*B = (a,B())
    return 0
}
