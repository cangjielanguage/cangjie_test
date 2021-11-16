// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan global variable a is not allowed to be used in differentiable function

var a = 3.0

@differentiable[stage:2]
func foo(x:Float64){
    a = x + 1.0
    return a
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
    if (dxdx >= 2.000001 || dxdx <= 1.999999){
        return 1
    }
    0
}