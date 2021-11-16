// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{}
class B <: A{}

func f(a: Int32) : A{return A()}
func f(a: Int64) : B{return B()}

func main():Int64{
    let a : A = f(1)
    let b : B = f(1)
    let c = f(1)
    var res = match (c) {
        case _ : B => true
        case _ => false
    }
    if (res) {
        return 0
    }
    return 1
}