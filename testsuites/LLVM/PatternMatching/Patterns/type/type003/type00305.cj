// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{}
class B <: A{}

func assert(input:B):Int32{
    return 1
}

func test(): Int64 {
    var i : A = A()
    var res = match (i) {
        case a : B => assert(a)
        case _ => 2
    }
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return test()
}
