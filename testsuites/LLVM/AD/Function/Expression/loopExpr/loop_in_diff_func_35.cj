// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupported binary operation

@differentiable
func f(x: Float64): Float64{
    var flag = true
    while (flag){
        !20
        10 << 1
        10 & 15
        flag = !flag
    }
    return x
}

func main(){
    return 0
}