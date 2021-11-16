// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{}

open class B <: A{}

class C <: B{}

func assert(input:A):Int32{
    return 1
}

func test(): Int64 {
    var i : C = C()
    var res = match (i) {
        case a : A => assert(a)
        case _ => 2
    }
    if (res == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return test()
}
