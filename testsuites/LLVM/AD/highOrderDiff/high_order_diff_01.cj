// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan invalid stage value, integer literal (1 and 2 are supported now) is expected


@differentiable[stage:0]
func foo(x:Float64){
    return x * x
}

@differentiable
func grad_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x)
    return bp(1.0)
}

func main() {
    return 0
}