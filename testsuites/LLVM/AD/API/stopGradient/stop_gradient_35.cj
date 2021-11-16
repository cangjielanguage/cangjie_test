// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

@differentiable
func f(x: Float64): Float64{
    var a = stopGradient<Float64>(match (x) { case _ => 2.0 }) // EXPECTED: regex match expression is not supported in differentiable function
    return x * a
}

func main() {
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 2.000001 || dx <= 1.999999){
        return 1
    }
    return 0
}
