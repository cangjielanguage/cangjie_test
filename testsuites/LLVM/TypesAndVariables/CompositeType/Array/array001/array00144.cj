// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class C0{}

open class C1 <: C0{}

open class C2 <: C1{}

open class C3 <: C1{}

class A <: C2{}

class B <: C3{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray0 : Array<C0> = @{a,b}
    let myArray1 : Array<C1> = @{a,b}
    return 0
}
