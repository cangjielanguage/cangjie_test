package pkg_A

@differentiable
external func square(x: Float64): Float64 {
    x * x
}

@adjoint[primal:square]
external func adjoint_square_a(x:Float64){
    return (
        x * x,
        {a : Float64 => 1.0 * a}
    )
}