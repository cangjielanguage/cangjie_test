// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// EXEC:%n.out 2>&1 | compare %f
// ASSERT: scan grad = 1.000000 grad = 1.000000
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


@differentiable
func foo(x: Float64, y : Float64) {
    return {=> x + y}()
}

func main() {
    var x = grad(foo, (2.0, 2.0))
    print("grad = ")
    print(x[0].toString())
    print(" ")
    print("grad = ")
    print(x[1].toString())
    return 0
}