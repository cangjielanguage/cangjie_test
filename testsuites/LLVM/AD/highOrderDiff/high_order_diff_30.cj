// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable[stage:2]
func foo(x:Float64){
    var mh = match (x) {
        case _ => 2.0
    }
    return mh*x
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