// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupport increment/decrement expr in differentiable function

@differentiable
func f(x: Float64): Float64 {
    var a: Float64 = 0.1
    while (x > 0.1) {
        x+x
        a++
    }
    return x
}

func main(){
    return 0
}