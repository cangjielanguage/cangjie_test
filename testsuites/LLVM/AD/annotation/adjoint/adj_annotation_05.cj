// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex The primal function for function g is not found.

@differentiable
func f(x : Float64){
    return x 
}

@adjoint[primal: f]
func g(x:Float32): (Float32)*((Float32) -> Float32){
    let temp : Float32 = 0.0 
    return (
        temp, 
        {dy: Float32 => return dy}
    )
}

func main(){
    return 0
}