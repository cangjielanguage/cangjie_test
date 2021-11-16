// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


@differentiable[stage:2]
func foo(x:Float64){
    return x * x + x
}

@differentiable
func grad_foo(x:Float64){
    var value = valWithGrad(foo, x)
    var (res, dx) = value
    return res
}

@differentiable
func grad_foo2(x:Float64){
    return foo(x)
}

func main() {
    let v = 1.0
    let dxdx1 = grad(grad_foo, v)
    let dxdx2= grad(grad_foo2, v)
    if (dxdx1 == dxdx2){
        return 0
    }
    return 1
}