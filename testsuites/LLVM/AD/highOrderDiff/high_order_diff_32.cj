// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable[stage:2]
func foo(x:Float64){
    let v1 = Option<Float64>.Some(2.0)
    v1 ?? 0.0
    return x
}

@differentiable
func grad_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x)
    return bp(v)
}

func main() {
    let v = 1.0
    let dxdx = grad(grad_foo, v)
    if (dxdx >= 4.000001 || dxdx <= 3.999999){
        return 1
    }
    return 0
}