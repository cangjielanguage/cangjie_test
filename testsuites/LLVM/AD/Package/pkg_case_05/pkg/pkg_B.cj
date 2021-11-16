package pkg_B
import pkg_A.*

@adjoint[primal:square]
func adjoint_square_b(x:Float64){
    return (
        x * x,
        {a : Float64 => 14.0 * a}
    )
}