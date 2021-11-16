// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// EXEC:%n.out 2>&1 | compare %f
// ASSERT: scan grad = true
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable[except:[x,y]]
func foo(x: Float64, y : Float64): Float64 {
    return x * x + x * y
}

func main() {
    var v: Float64 = 2.0
    var x = grad(foo, (v, 1.0))
    print("grad = ")
    let a = x == ()
    print(a.toString())
    return 0
}