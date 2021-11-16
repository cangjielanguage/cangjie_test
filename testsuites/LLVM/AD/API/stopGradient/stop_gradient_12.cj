// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex unsupport list literal in differentiable function

@differentiable
func f(x: Float64): Float64 {
    stopGradient<List<Float64>>([1.0, 2.0])
    return x
}

func main(){
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 1.000001 || dx <= 0.999999){
        return 1
    }
    return 0
}

