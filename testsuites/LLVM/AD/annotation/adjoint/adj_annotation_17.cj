// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex The return type of the function g should be a tuple type.

@differentiable
func f(x : Float32){
    return x 
}

@adjoint[primal:f]
func g(x:Float32){
    return ()
}

func main(){
    return 0
}