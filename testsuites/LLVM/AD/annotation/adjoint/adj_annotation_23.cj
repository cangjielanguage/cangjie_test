// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func f(x : Float32){
    return x 
}

@adjoint[primal:f]
record A {} // EXPECTED: regex-auto record doesn't support annotation 'adjoint' 

func main(){
    return 0
}