// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex The primal function for function g is not found.

@differentiable
func f(x : Int32){
    return x 
}

@adjoint[primal:f]
func g(x:Float64){
    return (
        1.0, 
        {dy: Float64 => return 2.0} 
    )
}

func main(){
    return 0
}