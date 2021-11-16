// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


@differentiable[stage:2]
func foo(x:Float64){
    return x * x
}

@differentiable
func grad_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x)
    return bp(1.0)
}

func main() {
    let v = 1.0
    let dxdx = grad(grad_foo, v) // 这里对h计算在v处的一阶导数， 实际上使用到了f函数的二阶导数
    if (dxdx >= 2.000001 || dxdx <= 1.999999){
        return 1
    }
    0
}