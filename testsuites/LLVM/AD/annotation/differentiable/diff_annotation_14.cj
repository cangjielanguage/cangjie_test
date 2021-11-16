// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable[dsadsa] // EXCEPTED: regex-auto unexpected character or identifier 'dsadsa'
func foo(y: Float32){
    return y
}

func main(){
    return 0
}