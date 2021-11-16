// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable [stage: 2]
func square(x: Float64): Float64 {
    x * x + x
}

@adjoint [primal: square]
func adjSquare(x: Float64) {
    (x * x, { sens: Float64 =>
        3.0 * x * sens
    })
}

func main() {
    var x: Float64 = 2.0
    var dx = grad(square, x)
    if (dx >= 6.000001 || dx <= 5.999999) {
        return 1
    }
    return 0
}