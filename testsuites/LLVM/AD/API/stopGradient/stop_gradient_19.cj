// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable[stage:2]
func foo(x:Float64){
    return x * stopGradient<Float64>(x)
}

@differentiable
func grad_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x)
    return bp(v)
}

func main() {
    let v = 2.0
    let dxdx = grad(grad_foo, v)
    if (dxdx >= 4.000001 || dxdx <= 3.999999){
        return 1
    }
    return 0
}