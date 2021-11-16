package pkg

@differentiable [stage: 2]
external func square(x: Float64): Float64 {
    x * x
}

@differentiable
@adjoint [primal: square]
external func adjointSquare(x: Float64) {
    (x * x, { sens: Float64 =>
        2.0 * x * sens
    })
}

@differentiable
external func squareGrad(x: Float64)
{
    let adj0 = adjointOf(square)
    let (v1, bp1) = adj0(x)
    bp1(v1)
}