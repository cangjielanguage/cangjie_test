// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


@differentiable
record Data {
    var d: Float64

    @differentiable [stage:2]
    init(x:Float64){
        d = x
    }
}

@differentiable
func grad_foo(x:Float64){
    var data = Data(x)
    return data.d
}

func main() {
    let v = 1.0
    let dxdx = grad(grad_foo, v)
    if (dxdx >= 1.000001 || dxdx <= 0.999999){
        return 1
    }
    return 0
}