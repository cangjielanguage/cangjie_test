// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func f(x : Float32){
    return x 
}

@adjoint[primal:f]
func g(x:Float32){
    let temp : Float32 = 0.0 
    return (
        temp, 
        let a = {dy: Float64 => return dy}() // EXPECTED: regex expected expression here
    )
}

func main(){
    return 0
}