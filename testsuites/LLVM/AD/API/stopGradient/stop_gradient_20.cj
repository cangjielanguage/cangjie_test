// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex grad input f is not a differentiable function

func f(x : Float64): Float64{
    return stopGradient<Float64>(stopGradient<Float64>(x))
}

func main(){
    var x = 2.0
    var dx = grad(f, x)
    return 0
}
