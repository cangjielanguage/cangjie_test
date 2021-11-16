// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex The return type of the function g should satisfy the first type must be same as the input of the second function.

@differentiable[except:[x]]
func f(x : Float64){
    return x
}

@adjoint[primal: f]
func g(x:Float32){
    let a : Float64 = 1.0
    let b : Float32 = 1.0
    return (
        b, 
        {dy: Float64 => return a} 
    )
}

func main(){
    return 0
}