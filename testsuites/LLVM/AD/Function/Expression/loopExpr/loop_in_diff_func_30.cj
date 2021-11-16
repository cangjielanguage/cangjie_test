// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output


@differentiable
func f(x: Float64): Float64{
    var r: Float64 = 1.0
    while (stopGradient<Float64>(r) < 5.0){
        r = r + 1.0
    }
    return r*x
}

func main(){
    var dx = grad(f, 2.0)
    if (dx >= 5.000001 || dx <= 4.999999){
        return 1
    }
    return 0
}