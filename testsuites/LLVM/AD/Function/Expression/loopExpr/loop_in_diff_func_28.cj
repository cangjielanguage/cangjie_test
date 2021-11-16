// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output  2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupport increment/decrement expr in differentiable function

@differentiable
func f(x: Float64): Float64{
    var r : Float64 = 0.0
    var flag = true
    while (stopGradient<Bool>(flag)){
        r++
        r--
        flag = false
    }
    return r*x
}

func main(){
    return 0
}