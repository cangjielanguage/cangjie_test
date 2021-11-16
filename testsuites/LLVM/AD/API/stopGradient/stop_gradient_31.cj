// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output


@differentiable
func f(x: Float64): Float64{
    var bar = {y: Float64 => stopGradient<Float64>(y + 3.0)}
    return x * bar(x)
}

func main(){
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 5.000001 || dx <= 4.999999){
        return 1
    }
    return 0
}
