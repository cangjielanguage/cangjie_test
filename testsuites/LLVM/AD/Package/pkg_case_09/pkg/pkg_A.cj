package pkg_A

@differentiable
external func foo(x:Float64){
    x
}

@adjoint[primal:goo]
external func adjoint_goo(x:Float64){
    return (
        x,
        {a : Float64 => 2.0 * a}
    )
}