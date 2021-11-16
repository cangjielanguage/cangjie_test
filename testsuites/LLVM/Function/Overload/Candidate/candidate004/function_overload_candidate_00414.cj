// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{}
class B <: A{}

func f(a: Int64) : A{return A()}
func f(a: Int16) : B{return B()}

func main():Int64{
    let a : A = f(1)
    let b : B = f(1)
    return 0
}