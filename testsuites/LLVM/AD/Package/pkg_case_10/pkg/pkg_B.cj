package pkg_B

@adjoint[primal:square]
external func adjoint_square_b(x:Float64){
    print("pkg_b")
    return (
        x * x,
        {a : Float64 => 14.0 * a}
    )
}