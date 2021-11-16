// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I{}

open class C{}

class A <: C & I{}

class B <: C & I{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray0 : Array<C> = @{a,b}
    let myArray1 : Array<I> = @{a,b}
    return 0
}
