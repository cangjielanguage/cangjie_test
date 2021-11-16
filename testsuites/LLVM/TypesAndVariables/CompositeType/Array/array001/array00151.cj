// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class C0{}

open class C1 <: C0{}

open class C2 <: C0{}

class A <: C1{}

class B <: C2{}


func main(): Int64 {
    var a = A()
    var b = B()
    let myArray = @{a,b,C1(),C2()}
    return 0
}
