// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex The return type of the function g should satisfy the first type must be same as the input of the second function.

@differentiable
func f(x : Float32): Float32{
    return x
}

@adjoint[primal: f]
func g(x:Float32){
    let temp : Int32 = 1
    return (
        temp, 
        {dy: Float32 => return dy}
    )
}

func main(){
    return 0
}