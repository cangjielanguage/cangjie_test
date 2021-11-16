// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class A{}

open class B <: A{}

class C <: B{}

func assert(input:C):Int32{
    return 1
}

func test(): Int64 {
    var i : A = A()
    var res = match (i) {
        case a : C => assert(a)
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
