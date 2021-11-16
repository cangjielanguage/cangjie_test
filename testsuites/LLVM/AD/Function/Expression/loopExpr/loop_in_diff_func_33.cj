// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupport range expr in differentiable function

@differentiable
func f(x: Float64): Float64{
    var flag = true
    while (flag){
        0..=10:2
        flag = !flag
    }
    return x
}

func main(){
    return 0
}