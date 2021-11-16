// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable [stage: 2]
func foo(x: Float64): Float64 {
    x * x
}

@differentiable [stage: 2]
@adjoint [primal: foo]
func adj_foo(x: Float64) {
    (x * x, { sens: Float64 =>
        2.0 * x * sens
    })
}

@differentiable
func grad_adj_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x)
    return bp(v)
}

@differentiable
func grad_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x)
    return bp(v)
}

func main() {
    let v = 1.0
    let dxdx1 = grad(grad_foo, v)
    let dxdx2 = grad(grad_adj_foo, v)
    if (dxdx1 >= 6.000001 || dxdx1 <= 5.999999){
        return 1
    }
    if (dxdx2 >= 6.000001 || dxdx2 <= 5.999999){
        return 1
    }
    return 0
}
