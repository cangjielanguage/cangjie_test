// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
func f(x : Float64): Float64{
    return stopGradient<Float64>(x)
}

func main(){
    var x = 2.0
    var dx = grad(f, x)
    if (dx != 0.0) {
        return 1
    }
    return 0
}
