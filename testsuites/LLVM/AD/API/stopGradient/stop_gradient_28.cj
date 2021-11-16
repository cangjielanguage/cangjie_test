// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
func f(x : Float64): Float64{
    var tp = (x-1.0, x+1.0)
    return x * stopGradient<Float64>(tp[0]) * stopGradient<Float64>(tp[1])
}

func main(){
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 3.000001 || dx <= 2.999999){
        return 1
    }
    return 0
}
