// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex The return type of the function g should satisfy the return type of the second function must be all in the inputs.

@differentiable
func f(x : Float32){
    return x 
}

@adjoint[primal:f]
func g(x:Float32){
    let temp : Float32 = 0.0 
    return (
        temp, 
        {dy: Float32 => return (x ,dy)}
    )
}

func main(){
    return 0
}