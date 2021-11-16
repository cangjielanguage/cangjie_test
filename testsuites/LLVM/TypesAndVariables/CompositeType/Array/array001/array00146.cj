// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class C {}

class A <: C{}

class B <: C{}

class D <: C{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray = @{a,b,D()}
    return 0
}
