// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


@differentiable[stage:2]
func foo(x:Float64, y:Float64){
    return x * x * x * y + y * y * x
}

@differentiable
func grad_foo(x:Float64, y:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x, y)
    return bp(1.0)
}

func main() {
    var x = 1.0
    var y = 1.0
    var adj = adjointOf(grad_foo) // 这里对h计算在v处的一阶导数， 实际上使用到了f函数的二阶导数
    var (grad_foo, secGrad_foo) = adj(x, y)

    print("grad_foo_x: ${grad_foo[0]}\n")
    print("grad_foo_y: ${grad_foo[1]}\n")

    let dx = secGrad_foo((1.0, 0.0))
    print("dxdx: ${dx[0]}\n")
    print("dydx: ${dx[1]}\n")

    let dy = secGrad_foo((0.0, 1.0))
    print("dxdy: ${dy[0]}\n")
    print("dydy: ${dy[1]}\n")

    0
}