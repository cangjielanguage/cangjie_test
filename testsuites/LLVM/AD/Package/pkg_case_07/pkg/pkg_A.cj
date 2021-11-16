package pkg_A

@adjoint[primal:square]
external func adjoint_square_a(x:Float64){
    return (
        x * x,
        {a : Float64 => 1.0 * a * x}
    )
}