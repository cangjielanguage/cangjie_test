// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


@differentiable[stage:2]
func foo(x:Float64, y:Float64){
    return x * y + y / x - x
}

@differentiable
func grad_foo(x:Float64, y:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x, y)
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

    if (grad_foo_x <= -1.000001 || grad_foo_x >= 0.999999) {
        return 1
    }
    if (grad_foo_y >= 2.000001 || grad_foo_y <= 1.999999) {
        return 2
    }
    if (dxdx >= 4.000001 || dxdx <= 3.999999) {
        return 3
    }
    if (dydx != 0.0) {
        return 4
    }
    if (dxdy != 0.0) {
        return 5
    }
    if (dydy != 0.0) {
        return 6
    }
    return 0
}