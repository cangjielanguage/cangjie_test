// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable[include: [y], except:[x]] // EXCEPTED: regex-auto 'include' and 'except' can't be used together
func foo(x: Int64, y: Float32){
    return y
}

func main(){
    return 0
}