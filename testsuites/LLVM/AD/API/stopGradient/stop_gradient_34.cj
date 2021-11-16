// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan argument type of nothing is not supported


@differentiable
func f(x: Float64): Float64{
    stopGradient<Float64>(return x)
}

func main() {
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 2.000001 || dx <= 1.999999){
        return 1
    }
    return 0
}
