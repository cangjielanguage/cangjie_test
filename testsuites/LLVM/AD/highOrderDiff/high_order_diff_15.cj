// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


@differentiable[stage:2]
func foo(x:Float64, y:Float64, z:Float64){
    return x * y * z
}

@differentiable
func grad_foo(x:Float64, y!:Float64=2.0, z!:Float64=3.0){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x,y,z)
    return bp(v)
}

func main() {
    var x = 1.0
    var y = 2.0
    var z = 3.0
    var adj = adjointOf(grad_foo)
    var (grad_foo, secGrad_foo) = adj(x, y, z)

    let grad_foo_x=grad_foo[0]
    let grad_foo_y=grad_foo[1]
    let grad_foo_z=grad_foo[2]

    let dx = secGrad_foo((1.0, 0.0, 0.0))
    let dxdx=dx[0]
    let dydx=dx[1]
    let dzdx=dx[2]

    let dy = secGrad_foo((0.0, 2.0, 0.0))
    let dxdy=dy[0]
    let dydy=dy[1]
    let dzdy=dy[2]

    let dz = secGrad_foo((0.0, 0.0, 3.0))
    let dxdz=dy[0]
    let dydz=dy[1]
    let dzdz=dy[2]

    if (grad_foo_x >= 36.000001 || grad_foo_x <= 35.999999) {
        return 1
    }
    if (grad_foo_y >= 18.000001 || grad_foo_y <= 17.999999) {
        return 2
    }
    if (grad_foo_z >= 12.000001 || grad_foo_z <= 11.999999) {
        return 3
    }
    if (dxdx >= 36.000001 || dxdx <= 35.999999) {
        return 4
    }
    if (dydx >= 36.000001 || dydx <= 35.999999) {
        return 5
    }
    if (dzdx >= 24.000001 || dzdx <= 23.999999) {
        return 6
    }
    if (dxdy >= 72.000001 || dxdy <= 71.999999) {
        return 7
    }
    if (dydy >= 18.000001 || dydy <= 17.999999) {
        return 8
    }
    if (dzdy >= 24.000001 || dzdy <= 23.999999) {
        return 9
    }
    if (dxdz >= 72.000001 || dxdz <= 71.999999) {
        return 10
    }
    if (dydz >= 18.000001 || dydz <= 17.999999) {
        return 11
    }
    if (dzdz >= 24.000001 || dzdz <= 23.999999) {
        return 12
    }
    return 0
}