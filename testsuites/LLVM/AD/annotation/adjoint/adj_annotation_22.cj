// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func f(x : Float32): Float32{
    return x 
}

@adjoint // EXPECTED: regex-auto expected '[' after 'adjoint'
func g(x:Float32){ 
    let temp : Float32 = 1.0 
    return (
        temp,
        {dy: Float32 => return dy} 
    )
}

func main(){
    return 0
}