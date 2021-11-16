// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
func f(x : Float64): Float64{
    var tmp = 1.0
    while(stopGradient<Float64>(tmp) > 10.0) {
        tmp = stopGradient<Float64>(tmp) + x
    }
    return x * tmp
}

func main(){
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 1.000001 || dx <= 0.999999){
        return 1
    }
    return 0
}
