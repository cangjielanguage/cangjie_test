// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan the function is not a top-level differentiable function identifier


class Data {
    var d: Float64

    init(x:Float64){
        d = x
    }

    @differentiable [stage:2, except:[this]]
    func foo(x:Float64){
        return x
    }
}

@differentiable
func grad_foo(x:Float64){
    var adj = adjointOf(Data(x).foo)
    var (v, bp) = adj(x)
    return bp(1.0)
}

func main() {
    let v = 1.0
    let dxdx = grad(grad_foo, v)
    print("${dxdx}")
    if (dxdx >= 1.000001 || dxdx <= 0.999999){
        return 1
    }
    return 0
}