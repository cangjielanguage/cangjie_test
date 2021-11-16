// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex The return type of the function g should satisfy the second function must have only one input.

@differentiable
func f(x : Float32){
    return x * x
}

@adjoint[primal:f]
func g(x:Float32){
    let a : Float32 = 1.0
    return (
        a,
        { => return a}
    )
}

func main(){
    return 0
}