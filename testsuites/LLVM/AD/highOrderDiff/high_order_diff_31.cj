// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupport increment/decrement expr in differentiable function

@differentiable[stage:2]
func foo(x:Float64){
    var a = 2.0
    a--
    return a*x
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