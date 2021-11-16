// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I0{}

interface I1 <: I0{}

interface I2 <: I0{}

interface I3 <: I0{}

class A <: I1 &I2 &I3{}

class B <: I1 &I2 &I3{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray0 : Array<I0> = @{a,b}
    let myArray1 : Array<I1> = @{a,b}
    let myArray2 : Array<I2> = @{a,b}
    let myArray3 : Array<I3> = @{a,b}
    return 0
}
