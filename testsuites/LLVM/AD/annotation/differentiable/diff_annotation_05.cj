// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex function foo failed the differentiability check

@differentiable[include: [y]]
func foo(x: Int64, y: Float32){
    return x
}

func main(){
    return 0
}