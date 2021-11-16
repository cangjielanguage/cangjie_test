// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// EXEC:%n.out 2>&1 | compare %f
// ASSERT: scan grad = 6.000000
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable[except:[y]]
func foo(x: Float64, y: Float64): Float64 {
    return x * x + x * y
}

func main() {
    var x = grad(foo, (2.0, 2.0))
    print("grad = ")
    print(x.toString())
    return 0
}