// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable [stage:2]
func bar(x:Float64) {
    return x*x
}


@differentiable[stage:2]
func foo(x:Float64){
    return bar(x)
}

@differentiable
func grad_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x)
    return bp(1.0)
}

func main() {
    let v = 1.0
    let dxdx = grad(grad_foo, v)
    if (dxdx >= 2.000001 || dxdx <= 1.999999){
        return 1
    }
    0
}