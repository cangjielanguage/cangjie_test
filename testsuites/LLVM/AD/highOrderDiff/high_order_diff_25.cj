// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable[stage: 2]
func foo(x:Float64){
    var temp = x
    while(stopGradient<Float64>(temp) < 5.0){
        temp = temp + x
    }
    return temp
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
    print("${dxdx}")
    if (dxdx != 0.0 ){
        return 1
    }
    return 0
}