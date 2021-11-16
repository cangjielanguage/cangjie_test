package pkg_B

@differentiable
external func goo(x:Float64){
    x
}

@adjoint[primal:foo]
external func adjoint_foo(x:Float64){
    return (
        x,
        {a : Float64 => 14.0 * a}
    )
}