package pkg_B
import pkg_A.*

@adjoint[primal:foo]
external func adjoint_foo(x:Float64){
    return (
        x,
        {a : Float64 => 14.0 * a}
    )
}