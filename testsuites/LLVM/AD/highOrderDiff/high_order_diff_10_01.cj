// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan type of return expression is incompatible with return type


@differentiable[stage:2]
func foo(){
    return 2.0
}

@differentiable
func grad_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj()
    return bp(()))
}

func main() {
    let v = 1.0
    let dxdx = grad(grad_foo, v)
    0
}