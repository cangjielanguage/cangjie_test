// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{}

class C <: A{}

func assert(input:C):Int32{
    return 1
}

func test(): Int64 {
    var i : A = C()
    var res = match (i) {
        case a : C => assert(a)
        case _ => 2
    }
    if (res == 1) { // Runtime type of i is C. So type pattern is valid.
        return 0
    }
    return 1
}

func main(): Int64 {
    return test()
}
