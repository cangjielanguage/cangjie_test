// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
func f(x: Float64): Float64{
    var temp  = 4
    stopGradient<Int64>(temp)
    return x * x
}

func main(){
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 4.000001 || dx <= 3.999999){
        return 1
    }
    return 0
}
