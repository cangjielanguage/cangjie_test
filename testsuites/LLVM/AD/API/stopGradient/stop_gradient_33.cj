// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output


@differentiable
record Point {
    let x: Float64

    @differentiable
    init(x1: Float64) {
        x = x1
    }
}

@differentiable
func f(x: Float64): Float64{
    return x * stopGradient<Float64>(Point(x).x)
}

func main() {
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 2.000001 || dx <= 1.999999){
        return 1
    }
    return 0
}
