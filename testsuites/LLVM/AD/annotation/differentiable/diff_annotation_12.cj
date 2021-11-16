// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex function foo failed the differentiability check
@ differentiable 
func foo(y: Int32){
    return y
}

func main(){
    return 0
}