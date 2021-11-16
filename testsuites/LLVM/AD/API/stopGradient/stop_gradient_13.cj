// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
func f(x: Float64): Float64 {
    var a = stopGradient<Float64*Float32>((2.0, 3.0))
    return x * a[0]
}

func main(){
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 2.000001 || dx <= 1.999999){
        return 1
    }
    return 0
}

