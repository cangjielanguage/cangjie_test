// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func f(x : Float32){
    return x
}

@adjoint[primal: f]
func g(x:Float32): (Float32)*((Float32) -> Float32){
    let temp : Float32 = 0.0 
    return (
        temp, 
        {dy: Float32 => } // EXPECTED: regex return type mismatch
    )
}

func main(){
    return 0
}