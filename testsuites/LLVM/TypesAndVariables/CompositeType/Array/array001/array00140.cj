// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I{}

class A <: I{}

class B <: I{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray0 : Array<I> = @{a,b,A()}
    return 0
}
