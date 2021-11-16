// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I3 {}
interface I4 <: I3 {}
interface I2 <: I4 {}
interface I1 <: I2 & I3 {}
func f(x: I4):Int64 {return 1}
func f(x: I3):Int64 {return 2}
class C1 <: I1 {}

func main(){
    var obj = C1()
    var result = f(obj) // match (f(x: I4)) {...}
    if (result == 1) {
        return 0
    }
    return 1
}