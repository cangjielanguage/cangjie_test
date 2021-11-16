// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


@differentiable[stage:2,except:[z]]
func foo(x:Float64, y:Float64, z!:String){
    return x * x * x * y + y * y * x
}

@differentiable
func grad_foo(x:Float64, y:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x, y, "hi")
    return bp(1.0)
}

func main() {
    var x = 1.0
    var y = 2.0
    var adj = adjointOf(grad_foo)
    var (grad_foo, secGrad_foo) = adj(x, y)

    let grad_foo_x = grad_foo[0]
    let grad_foo_y = grad_foo[1]

    let dx = secGrad_foo((1.0, 0.0))
    let dxdx = dx[0]
    let dydx = dx[1]

    let dy = secGrad_foo((0.0, 2.0))
    let dxdy = dy[0]
    let dydy = dy[1]

    if (grad_foo_x >= 10.000001 || grad_foo_x <= 9.999999) {
        return 1
    }
    if (grad_foo_y >= 5.000001 || grad_foo_y <= 4.999999) {
        return 2
    }
    if (dxdx >= 12.000001 || dxdx <= 11.999999) {
        return 3
    }
    if (dydx >= 7.000001 || dydx <= 6.999999) {
        return 4
    }
    if (dxdy >= 14.000001 || dxdy <= 13.999999) {
        return 5
    }
    if (dydy >= 4.000001 || dydy <= 3.999999) {
        return 6
    }
    0
}