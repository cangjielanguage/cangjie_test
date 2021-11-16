// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{
    let a : Int64 = 1
    operator func +(inputA:A,inputB:A):Int64{
        return 0
    }
}

class B <: A{}


func main():Int64{
    var a : A = B()
    return a+a
}
