// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


@differentiable[stage:2]
func foo(xFloat64){
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
    let dxdx = grad(grad_foo, v) // hv f
    if (dxdx >= 2.000001 || dxdx <= 1.999999){
        return 1
    }
    0
