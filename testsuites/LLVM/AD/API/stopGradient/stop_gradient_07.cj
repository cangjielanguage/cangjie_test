// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output


@differentiable
func f(x: Float32): Float32 {
    var c = stopGradient<Float32>(x+1.0)
    return  c * x
}

func main(){
    var x: Float32 = 2.0
    var dx = grad(f, x)
    if (dx >= 3.000001 || dx <= 2.999999){
        return 1
    }
    return 0
}

