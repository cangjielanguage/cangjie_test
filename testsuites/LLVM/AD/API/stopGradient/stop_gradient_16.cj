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
func f(x: Float64): Float64 {
    var p = stopGradient<Point>(Point(1.0))
    return x * p.x
}


func main() {
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 1.000001 || dx <= 0.999999) {
        return 1
    }
    return 0
}

