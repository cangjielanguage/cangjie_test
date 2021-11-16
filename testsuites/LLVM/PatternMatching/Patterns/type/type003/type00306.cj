// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{}
interface B <: A{}

class C <: A{}

func assert(input:B):Int32{
    return 1
}

func test(): Int64 {
    var i : A = C()
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
