// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupport adjointOf expr in differentiable function whose stage is larger than 1


@differentiable[stage:1]
func foo(x:Float64){
    return x * x + x
}

@differentiable[stage:2]
func grad_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x)
    return bp(v)
}

func main() {
    let v = 1.0
    let dxdx = grad(grad_foo, v)
    if (dxdx >= 2.000001 || dxdx <= 1.999999){
        return 1
    }
    0
}