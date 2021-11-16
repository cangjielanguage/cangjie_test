// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan adjAdjSquare defined error, can not define adjoint function's adjoint function

@differentiable [stage: 2]
func square(x: Float64): Float64 {
    x * x
}

@differentiable
@adjoint [primal: square]
func adjSquare(x: Float64) {
    (x * x, { sens: Float64 =>
        2.0 * x * sens
    })
}

@adjoint [primal: adjSquare]
func adjAdjSquare(x: Float64) {
    ((x * x, { sens: Float64 =>
        2.0 * x * sens
    }), {sens: (Float64*(Float64)->Float64) =>
        2.0 * x * sens[0]
    })
}

func main() {
    return 0
}