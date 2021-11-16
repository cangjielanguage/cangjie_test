// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// EXEC:%n.out 2>&1 | compare %f
// ASSERT: scan grad = 2.000000
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable
func foo(x: Float64): Float64 {
    return x + x
}

func main() {
    var v: Float64 = 2.0
    var x = grad(foo, v)
    print("grad = ")
    print(x.toString())
    return 0
}