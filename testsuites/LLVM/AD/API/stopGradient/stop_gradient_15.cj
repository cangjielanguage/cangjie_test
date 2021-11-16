// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output


@differentiable
func bar(x: Float64) {
    return x * 2.0
}

@differentiable
func foo(x: Float64): Float64 {
    var b = stopGradient<(Float64)->Float64>(bar)
    return x * b(stopGradient<Float64>(x))
}

func main(){
    var x = 2.0
    var dx = grad(foo, x)
    print("${dx}")
    if (dx >= 4.000001 || dx <= 3.999999){
        return 1
    }
    return 0
}

