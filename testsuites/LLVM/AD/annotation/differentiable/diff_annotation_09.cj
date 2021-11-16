// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable[] // EXPECTED: regex-auto unexpected []
func foo(y: Float32){
    return y
}

func main(){
    return 0
}