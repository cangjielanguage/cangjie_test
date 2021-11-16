package pkg_B

@adjoint[primal:square]
external func adjoint_square_b(x:Float64){
    return (
        x * x,
        {a : Float64 => 14.0 * a}
    )
}