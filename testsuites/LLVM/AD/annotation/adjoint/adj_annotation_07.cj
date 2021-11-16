// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex The primal function for function g is not found

@differentiable
func f(x : Float32){
    return x * x
}

@adjoint[primal: f]
func g(x:Float32){
    let temp : Float32 = 0.0 
    return (
        temp, 
        {dy: Float32 => } 
    )
}

func main(){
    return 0
}